package makers
{
   import d2hooks.*;
   import d2actions.*;
   
   public class PartyMemberMenuMaker extends PlayerMenuMaker
   {
      
      public function PartyMemberMenuMaker() {
         super();
      }
      
      override public function createMenu(data:*, param:Object) : Array {
         var playerName:String = data.name;
         var playerId:uint = data.id;
         var playerAlignement:Object = null;
         var playerGuild:Object = null;
         var playerIsOnSameMap:Boolean = data.onSameMap;
         if(playerIsOnSameMap)
         {
            playerAlignement = data.alignmentInfos;
         }
         if(data.hasOwnProperty("guildInformations"))
         {
            playerGuild = data.guildInformations;
         }
         _partyId = int(param);
         return super.createMenu2(playerName,playerId,false,playerAlignement,data.guildInformations,null,null,0,data.cantBeChallenged,data.cantExchange);
      }
   }
}
