package makers
{
   import d2hooks.*;
   import blocks.TextTooltipBlock;
   import blocks.EffectTooltipBlock;
   
   public class EffectsTooltipMaker extends Object
   {
      
      public function EffectsTooltipMaker() {
         super();
      }
      
      public function createTooltip(data:*, param:Object) : Object {
         var bg:String = null;
         var dataApi:Object = Api.data;
         if((param) && (param.noBg))
         {
            bg = "chunks/base/base.txt";
         }
         else
         {
            bg = "chunks/base/baseWithBackground.txt";
         }
         var tooltip:Object = Api.tooltip.createTooltip(bg,"chunks/base/container.txt","chunks/base/separator.txt");
         var effects:Object = data;
         tooltip.addBlock(new TextTooltipBlock(effects.spellName,{"css":"[local.css]tooltip_title.css"}).block);
         tooltip.addBlock(new TextTooltipBlock(Api.ui.getText("ui.fight.caster") + Api.ui.getText("ui.common.colon") + data.casterName,{"css":"[local.css]tooltip_default.css"}).block);
         tooltip.addBlock(new EffectTooltipBlock(effects.effects).block);
         return tooltip;
      }
   }
}
