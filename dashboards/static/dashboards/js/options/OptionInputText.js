
import { OptionInput } from './OptionInput.js';
import { Label, InputText } from '../builders/BuildingBlocks.js';

export class OptionInputText extends OptionInput {
    constructor(context, component_data, input_data) {
        super(input_data);
        
        this.addClass('form-group');
        const label = new Label().attachTo(this);
        label.setTextContent(input_data.label);
        
        this.input = new InputText().attachTo(this);
        this.input.addClass("form-control");
        this.input.setValue(input_data.value);

        $(this.input.dom).on('change paste', () => {
            context.signals.onOptionChanged.dispatch(component_data.uuid, this.getData());
        });        
    }
    
}