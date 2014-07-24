package d2actions
{
   public class MoodSmileyRequest extends Object implements IAction
   {
      
      public function MoodSmileyRequest(id:int) {
         super();
         this._params = [id];
      }
      
      public static const NEED_INTERACTION:Boolean = false;
      
      public static const NEED_CONFIRMATION:Boolean = false;
      
      public static const MAX_USE_PER_FRAME:int = 1;
      
      public static const DELAY:int = 2000;
      
      private var _params:Array;
      
      public function get parameters() : Array {
         return this._params;
      }
   }
}
