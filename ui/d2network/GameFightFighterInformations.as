package d2network
{
   public class GameFightFighterInformations extends GameContextActorInformations
   {
      
      public function GameFightFighterInformations() {
         super();
      }
      
      public function get teamId() : uint {
         return new uint();
      }
      
      public function get wave() : uint {
         return new uint();
      }
      
      public function get alive() : Boolean {
         return new Boolean();
      }
      
      public function get stats() : GameFightMinimalStats {
         return new GameFightMinimalStats();
      }
   }
}
