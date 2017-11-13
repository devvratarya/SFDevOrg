/**
 * Created by darya on 11/11/2017.
 */
({
    doInit : function(component, event, helper) {
        //alert("Hello! I am an alert box!!");
        //alert('this is init');

    },
    check:function (component, event, helper){
      //alert("Hello! jquerry initiate");
      var comp = component.find('testcomm');
        var label = component.get("v.testbg");
        if(label){
            $A.util.addClass(comp, "custom-bg");
            //$('.custom-bg').css('background-image','url(/resource/testImage)');
        }
        else{
            $A.util.addClass(comp, "custom-bg_new");
            //$('.custom-bg').css('background-image','url(/resource/little_insight)');
        }
    },
    showfile:function(component,event,helper){
      /*  helper.show(component,event);

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
        reader.readAsDataURL(file);*/
    }
})