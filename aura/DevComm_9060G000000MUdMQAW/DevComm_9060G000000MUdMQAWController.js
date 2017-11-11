/**
 * Created by darya on 11/11/2017.
 */
({
    doInit : function(component, event, helper) {
        //alert('this is init');
    },
    showfile:function(component,event,helper){
        helper.show(component,event);

        var f = event.target.files[0];
        var fileInput = component.find("file").getElement();
        var file = fileInput.files[0];

        var reader = new FileReader();
        reader.onloadend = function(e) {
            var contents = e.target.result;
            var base64Mark = 'base64,';
            var dataStart = contents.indexOf(base64Mark) + base64Mark.length;
            var fileContents = contents.substring(dataStart);

            helper.upload(component, file, encodeURIComponent(fileContents), function(answer) {
                if (answer) {
                    helper.hide(component,event);
                }
                else{
                }
            });
        }
        reader.readAsDataURL(file);
    }
})