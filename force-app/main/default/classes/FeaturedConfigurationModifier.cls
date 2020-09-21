public with sharing class FeaturedConfigurationModifier 
extends wavetemplate.WaveTemplateConfigurationModifier {
    public override void beforeAppCreate(wavetemplate.WaveTemplateInfo template, wavetemplate.Answers answers)
    {
        checkFeatureValues(answers);
    }

     public override void beforeAppUpdate(wavetemplate.WaveTemplateInfo template, String previousAppVersion, wavetemplate.Answers answers)
     {
        checkFeatureValues(answers);
     }

     private void checkFeatureValues(wavetemplate.Answers answers){
        Boolean basicEnabled = FeatureManagement.checkPackageBooleanValue('eadl_ra__BasicMode');
        Boolean extendedEnabled = FeatureManagement.checkPackageBooleanValue('eadl_ra__ExtendedMode');
        Boolean growthEnabled = FeatureManagement.checkPackageBooleanValue('eadl_ra__GrowthMode');
        answers.put('BasicEnabled', basicEnabled);
        answers.put('ExtendedEnabled', extendedEnabled);
        answers.put('GrowthEnabled', growthEnabled);
        /*
        if (growthEnabled){
            answers.put('AppLabel', 'Dataflow App - Growth');
        } else if (extendedEnabled){
            answers.put('AppLabel', 'Dataflow App - Extended');            
        } else {
            answers.put('AppLabel', 'Dataflow App - Basic');                        
        }
        */  
     }
}
