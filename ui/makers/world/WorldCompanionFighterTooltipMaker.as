package makers.world
{
   import blocks.MonsterFightBlock;
   import d2hooks.*;
   
   public class WorldCompanionFighterTooltipMaker extends Object
   {
      
      public function WorldCompanionFighterTooltipMaker() {
         super();
      }
      
      public function createTooltip(data:*, param:Object) : Object {
         var tooltip:Object = Api.tooltip.createTooltip("chunks/base/baseWithBackground.txt","chunks/base/container.txt","chunks/base/separator.txt");
         tooltip.addBlock(new MonsterFightBlock().block);
         return tooltip;
      }
   }
}
