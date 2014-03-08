package com.ankamagames.dofus.network.messages.game.inventory.exchanges
{
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.IDataOutput;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class ExchangeRequestOnTaxCollectorMessage extends NetworkMessage implements INetworkMessage
   {
      
      public function ExchangeRequestOnTaxCollectorMessage() {
         super();
      }
      
      public static const protocolId:uint = 5779;
      
      private var _isInitialized:Boolean = false;
      
      override public function get isInitialized() : Boolean {
         return this._isInitialized;
      }
      
      public var taxCollectorId:int = 0;
      
      override public function getMessageId() : uint {
         return 5779;
      }
      
      public function initExchangeRequestOnTaxCollectorMessage(param1:int=0) : ExchangeRequestOnTaxCollectorMessage {
         this.taxCollectorId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void {
         this.taxCollectorId = 0;
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
      
      public function serialize(param1:IDataOutput) : void {
         this.serializeAs_ExchangeRequestOnTaxCollectorMessage(param1);
      }
      
      public function serializeAs_ExchangeRequestOnTaxCollectorMessage(param1:IDataOutput) : void {
         param1.writeInt(this.taxCollectorId);
      }
      
      public function deserialize(param1:IDataInput) : void {
         this.deserializeAs_ExchangeRequestOnTaxCollectorMessage(param1);
      }
      
      public function deserializeAs_ExchangeRequestOnTaxCollectorMessage(param1:IDataInput) : void {
         this.taxCollectorId = param1.readInt();
      }
   }
}