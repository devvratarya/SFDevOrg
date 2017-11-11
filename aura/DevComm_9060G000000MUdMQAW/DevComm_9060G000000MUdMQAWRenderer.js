/**
 * Created by darya on 11/11/2017.
 */
({
     render : function(cmp, helper) {
        var ret = this.superRender();

        var comp = cmp.find('testcomm');
        var label = cmp.get("v.testbg");
        if(label){
            $A.util.addClass(comp, "custom-bg");
            //$('div.custom-bg').css('background-image','url(/resource/testImage)');
        }
        else{
            $A.util.addClass(comp, "custom-bg_new");
            //$('div.custom-bg').css('background-image','url(/resource/little_insight)');
        }
        // do custom rendering here
        //alert('this is Render');
        return ret;
     }
})