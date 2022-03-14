

import { Context } from './Context.js';
import { ErrorModal } from './modals/ErrorModal.js';
import { AreYouSureModal } from './modals/AreYouSureModal.js';
import { WarningModal } from './modals/WarningModal.js';
import { DataRangePicker } from './temporal/DataRangePicker.js';
import { Dashboard } from './dashboards/Dashboard.js';
import { 
    MSG_OVERRIDE_LAYOUT, 
    MSG_NO_SAVE,
    MSG_DELETE_DASHBOARD,
    //MSG_OVERRIDE_DASHBOARD
} from './messages.js';
import { EditComponentModal } from './modals/EditComponentModal.js';
import { SelectComponentModal } from './modals/SelectComponentModal.js';
import { SelectDashboardModal } from './modals/SelectDashboardModal.js';
import { DashboardPropertiesModal } from './modals/DashboardPropertiesModal.js';
import { LayoutSelectionModal } from './modals/LayoutSelectionModal.js';
import { LayoutEditorModal } from './modals/LayoutEditorModal.js';
import { fetchGET, fetchPOST } from "./Fetch.js";
import { 
    URL_GET_DASHBOARD,
    URL_SAVE_CONFIG,
    URL_GET_CONFIG
} from "./urls.js";
import { CommsManager } from './comms/CommsManager.js';

// -----------------
// --- CONSTANTS ---
// -----------------

const MODALS_CONTAINER = $('#modals-container');
const DATE_INTERVAL = $('#date-interval');

const ZOOM_MODAL = $('#zoom-modal');
const DASHBOARD_SAVE_BTN = $('#save-btn');
const DASHBOARD_EDIT_BTN = $('#edit-btn');
const EDIT_APPLY_BTN = $('#edit-apply-btn');
const DASHBOARD_OPEN_BTN = $('#open-btn');
const DISPLAY_LAYOUT_MODAL = $('#layout-choice-btn');
const LOCATION_BTN = $('#location-btn');
const DASHBOARD_PRINT_BTN = $('#print-btn');
const DASHBOARD_NEW_BTN = $('#new-btn');
const DASHBOARD_DELETE_BTN = $('#delete-btn');
const SWAP_BTN = $('#swap-btn');
const PIN_DASH_BTN = $('#pin-dash-btn');
const DASH_EDIT_TAB = $('#dash-edit-tab');

const PAGE_URL = '/dashboards';
const SELECTABLE_COMPONENTS = '.editable-component';
const NON_SELECTABLE_COMPONENTS = '.non-editable-component';
const DATARANGE_BTN_ID = '#daterange-btn';

const DEFAULT_LAYOUT = 2;   // if doesn't exists => fetch first | error


// ---------------------------
// --- CONTEXT AND GLOBALS ---
// ---------------------------

/**
 * THE CONTEXT - USED AS A GLOBAL OBJECT
 */
const context = new Context();

/**
 * HOLDS THE CURRENT DASHBOARD
 */
let dashboard = null;

let new_dash = false;    // new dashboard?


// ------------------------------
// --- MAIN AND GLOBAL MODALS ---
// ------------------------------

/**
 * EDIT COMPONENT MODAL
 */
const edit_component_modal = new EditComponentModal(context);

/**
 * SELECT COMPONENT MODAL
 */

const select_component_modal = new SelectComponentModal(context);

/**
 * SELECT DASHBOARD MODAL
 */

 const select_dashboard_modal = new SelectDashboardModal(context);

 /**
 * SELECT DASHBOARD MODAL
 */
const dashboard_properties_modal = new DashboardPropertiesModal(context);


 /**
 * SELECT LAYOUT MODAL
 */
const layout_selection_modal = new LayoutSelectionModal(context);


/**
* ERROR MODAL.
* TRIGGERED BY THE ONERROR SIGNAL.
*/
const error_modal = new ErrorModal().attachTo(MODALS_CONTAINER[0]);

/**
 * ARE YOU SURE MODAL.
 * TRIGGERED BY THE ONAYS SIGNAL.
 */
const ays_modal = new AreYouSureModal().attachTo(MODALS_CONTAINER[0]);


/**
 * WARNING MODAL.
 * TRIGGERED BY THE ONWARNING SIGNAL.
 */
 const warning_modal = new WarningModal().attachTo(MODALS_CONTAINER[0]);


/**
 * LAYOUT EDITOR MODAL
 */
 const layout_editor_modal = new LayoutEditorModal(context);


/**
 * Communications manager
 */
 const comms = new CommsManager(context);


// -----------------
// --- LISTENERS ---
// -----------------

context.signals.onError.add((msg, origin=null) => {
    error_modal.show(msg);
    console.error((origin?origin:'') + msg);
});

context.signals.onAYS.add((text, ok_callback, cancel_callback) => {
    ays_modal.show(text, ok_callback, cancel_callback);
});

context.signals.onWarning.add((text) => {
    warning_modal.show(text);
});

context.signals.onChanged.add(() => {
    console.log("somethiognv cjhanged");
    changeSaveStatus(true);
});

context.signals.onZoomComponent.add((msg, body) => {
    ZOOM_MODAL.modal('show');
    /*
    $("#zoom-modal-body").empty();
    $(body.dom).clone().appendTo($("#zoom-modal-body"))
    */
});

context.signals.onEditComponent.add((spot, original_type) => {
    const component = dashboard.getComponentAt(spot);
    edit_component_modal.show(component, () => {
        if (component.data.component_type === 'INFO' && original_type !== 'INFO') {
            const new_comp = dashboard.changeComponentContainer(spot, true);
            new_comp.update();
        } else if (component.data.component_type !== 'INFO' && original_type === 'INFO') {
            const new_comp = dashboard.changeComponentContainer(spot, false);
            new_comp.update();
        } else {           
            component.update();
        }
        // UPDATE COMMS        
        comms.updateComponent(component);
    });
});

context.signals.onLoadComponent.add((spot) => {
    select_component_modal.show((component_id => {
        dashboard.loadComponent(spot, component_id);
    }));
});


context.signals.onLayoutEditor.add((spot) => {
    layout_editor_modal.show((new_layout_id) => {
        comms.reset();
        dashboard = new Dashboard(context, new_layout_id, null/*, true*/);        
    });
});

// ----------------
// TOP ROW ACTIONS
// ----------------

// ENTERS EDIT MODE
DASHBOARD_EDIT_BTN.on('click',function() {
    enterEditMode(true);
})

// EXITS EDIT MODE
EDIT_APPLY_BTN.on('click',function() {
    /*
    if (context.changed) {
        context.signals.onAYS.dispatch(MSG_NO_SAVE, () => {
            exitEditMode();
        });
    } else {
        exitEditMode();
    }
    */
    enterEditMode(false);
})

// OPENS DASHBOARD
DASHBOARD_OPEN_BTN.on('click',function() {
    select_dashboard_modal.show((dash_id) => {
        console.log("load dash > ", dash_id);

        getDashboard(dash_id, (result) => {
            dashboard = new Dashboard(context, result.layout, result);
            comms.restore(result);
        });
        //dashboard = new Dashboard(context, dashboard_id, null);
    });
})

// NEW LAYOUT
DISPLAY_LAYOUT_MODAL.on('click',function() {
    if (context.changed) {
        context.signals.onAYS.dispatch(MSG_OVERRIDE_LAYOUT, () => {
            layout_selection_modal.show(dashboard.layout_id, (selection) => {
                newDashboard(selection/*, true*/);                
            })
        });
    } else {
        layout_selection_modal.show(dashboard.layout_id,(selection) => {
            newDashboard(selection/*, true*/);            
        })        
    }
})

// NEW GLOBAL LOCATION
LOCATION_BTN.on('click',function() {
});

// PRINT DASHBOARD
DASHBOARD_PRINT_BTN.on('click',function() {
});

// SAVE DASHBOARD
DASHBOARD_SAVE_BTN.on('click',function() {
    dashboard_properties_modal.show(dashboard, () => {
        console.log("DASHBOARD SAVED");
        changeSaveStatus(false);
    });
});

// NEW DASHBOARD
DASHBOARD_NEW_BTN.on('click',function() {
    localStorage.setItem("dash_new", true); 
    if (context.changed) {
        context.signals.onAYS.dispatch(MSG_NO_SAVE, () => {
            window.location.replace(PAGE_URL);   
        });
    } else {
        window.location.replace(PAGE_URL); 
    }
});



// DELETE CURRENT DASHBOARD
DASHBOARD_DELETE_BTN.on('click',function() {
    if (!dashboard.id) return;
    context.signals.onAYS.dispatch(MSG_DELETE_DASHBOARD, () => {
        dashboard.delete(() => {
            comms.reset();
            dashboard = new Dashboard(context, 2, null/*, true*/);
        });
    });
});

// SWAP COMPONENTS POSITION
SWAP_BTN.on('click',function() {
});


// PIN CURRENT DASHBOARD
// when dashboard view opens, 
// the pin dashboard will be loaded and displayed
PIN_DASH_BTN.on('click',function() {
    // only save if dashboard exists in db
    if (dashboard.id) {
        saveConfig(() => {})
    }    
});


// -------------
// INIT
// -------------

//DASH_EDIT_TAB.hide();

const date_interval = new DataRangePicker(DATARANGE_BTN_ID, (start, end) => {
    DATE_INTERVAL.html(start + ' - ' + end);
    context.date_start = start;
    context.date_end = end;  
    context.signals.onGlobalData.dispatch(start, end);
})

$(function(){
    // default date: last month
    const interval = date_interval.getDate();
    DATE_INTERVAL.html(interval[0] + ' - ' + interval[1]);
    context.date_start = interval[0];
    context.date_end = interval[1];
});


// INIT - LO
if (localStorage.getItem("dash_new") === null || !localStorage.getItem("dash_new")) {
    localStorage.removeItem("dash_new"); 
    loadConfig((config) => {
        if (config.config !== null) {
            getDashboard(config.dashboard, (result) => {
                dashboard = new Dashboard(context, result.layout, result);
                comms.restore(result);
                new_dash = false;
                changeSaveStatus(false);
            });        
        } else {
            comms.reset();
            dashboard = new Dashboard(context, DEFAULT_LAYOUT);
            new_dash = true;
            changeSaveStatus(true);
        }
    })
} else {
    comms.reset();
    dashboard = new Dashboard(context, DEFAULT_LAYOUT);
    new_dash = true;
    changeSaveStatus(true);
    localStorage.removeItem("dash_new"); 
}
//changeSaveStatus(true);






// -------------
// FUNCTIONS
// -------------

/**
 * 
 * @param {boolean} new_status 
 */
function changeSaveStatus(new_status) {
    context.changed = new_status;
    if (new_status) {
        DASHBOARD_SAVE_BTN.removeClass('btn-outline-secondary').addClass('btn-danger');
        DASHBOARD_SAVE_BTN.removeAttr('disabled');
    } else {
        DASHBOARD_SAVE_BTN.removeClass('btn-danger').addClass('btn-outline-secondary');        
        DASHBOARD_SAVE_BTN.attr('disabled', true);
    }
}

/**
 * Exits the edit mode.
 */
function enterEditMode(enter=true) {
    if (enter) {
        $(SELECTABLE_COMPONENTS).show();
        $(NON_SELECTABLE_COMPONENTS).hide();
        context.edit_mode = true;
        DASH_EDIT_TAB.removeClass('d-none')
    } else {
        $(SELECTABLE_COMPONENTS).hide();
        $(NON_SELECTABLE_COMPONENTS).show();
        context.edit_mode = false;
        DASH_EDIT_TAB.addClass('d-none')
    }
}


/**
 * Starts a new dashboard.
 * @param {number} layout_id Layout ID.
 * @param {boolean} edit_mode Edit mode?
 */
function newDashboard(layout_id/*, edit_mode = false*/) {
    comms.reset();
    dashboard = new Dashboard(context, layout_id, null/*, edit_mode*/);
    $(SELECTABLE_COMPONENTS).show();
    DASHBOARD_EDIT_BTN.trigger('click');
}


/**
 * Loads the last config of this user.
 * TODO: for now it gets the first config (if it exists)
 * @param {function} onReady Called when ready
 */
function loadConfig(onReady = null) {
    $("body").css("cursor","progress");
    fetchGET(URL_GET_CONFIG, 
        (result) => {                
            $("body").css("cursor","auto");
            console.log(result);
            if (onReady) onReady(result);
        },
        (error) => {
            $("body").css("cursor","auto");
            context.signals.onError.dispatch(error,"[main::loadConfig]");                
        }
    );
}


/**
 * 
 * @param {function} onReady Called when ready;
 */
function saveConfig(onReady = null) {
    $("body").css("cursor","progress");
    fetchPOST(URL_SAVE_CONFIG,
        {
            dashboard: dashboard.id,
            name: uuidv4(),
        },  
        (result) => {                
            $("body").css("cursor","auto");
            console.log(result);
            if (onReady) onReady(result);
        },
        (error) => {
            $("body").css("cursor","auto");
            context.signals.onError.dispatch(error,"[main::loadConfig]");                
        }
    );
}


/**
 * 
 * @param {number} dash_id Dashboard ID.
 * @param {function} onReady Called when ready.
 */
function getDashboard(dash_id, onReady = null) {
    $("body").css("cursor","progress");
    fetchGET(URL_GET_DASHBOARD + dash_id, 
        (result) => {                
            $("body").css("cursor","auto");
            //console.log(result);
            if (onReady) onReady(result);
            //dashboard = new Dashboard(context, result.layout, result);
        },
        (error) => {
            $("body").css("cursor","auto");
            context.signals.onError.dispatch(error,"[main::getDashboard]");                
        }
    );
}