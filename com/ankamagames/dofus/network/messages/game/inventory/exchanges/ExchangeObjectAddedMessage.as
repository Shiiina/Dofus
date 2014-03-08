package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.dofus.network.types.game.data.items.ObjectItem;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class ExchangeObjectAddedMessage extends ExchangeObjectMessage implements INetworkMessage
   {
      
      public function ExchangeObjectAddedMessage() {
         this.object = new ObjectItem();
         super();
      }
      
      public static const protocolId:uint = 5516;
      
      private var _isInitialized:Boolean = false;
      
      override public function get isInitialized() : Boolean {
         return (super.isInitialized) && (this._isInitialized);
      }
      
      public var object:ObjectItem;
      
      override public function getMessageId() : uint {
         return 5516;
      }
      
      public function initExchangeObjectAddedMessage(param1:Boolean=false, param2:ObjectItem=null) : ExchangeObjectAddedMessage {
         super.initExchangeObjectMessage(param1);
         this.object = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void {
         super.reset();
         this.object = new ObjectItem();
         this._isInitialized = false;
      }
      
      override public function pack(param1:IDataOutput) : void {
         var _loc2_:ByteArray = new ByteArray();
         this.serialize(_loc2_);
         writePacket(param1,this.getMessageId(),_loc2_);
      }
      
      override public function unpack(param1:IDataInput, param2:uint) : void {
         this.deserialize(param1);
      }
      
      override public function serialize(param1:IDataOutput) : void {
         this.serializeAs_ExchangeObjectAddedMessage(param1);
      }
      
      public function serializeAs_ExchangeObjectAddedMessage(param1:IDataOutput) : void {
         super.serializeAs_ExchangeObjectMessage(param1);
         this.object.serializeAs_ObjectItem(param1);
      }
      
      override public function deserialize(param1:IDataInput) : void {
         this.deserializeAs_ExchangeObjectAddedMessage(param1);
      }
      
      public function deserializeAs_ExchangeObjectAddedMessage(param1:IDataInput) : void {
         super.deserialize(param1);
         this.object = new ObjectItem();
         this.object.deserialize(param1);
      }
   }
}