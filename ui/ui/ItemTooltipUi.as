package ui
{
   import d2api.SystemApi;
   import d2api.TooltipApi;
   import d2api.ContextMenuApi;
   import d2api.UiApi;
   import d2api.InventoryApi;
   import d2components.GraphicContainer;
   import flash.utils.Timer;
   import d2hooks.*;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.geom.Rectangle;
   import d2enums.LocationEnum;
   import flash.filters.GlowFilter;
   
   public class ItemTooltipUi extends Object
   {
      
      public function ItemTooltipUi() {
         super();
      }
      
      private static var _compareTooltips:Array;
      
      public var modContextMenu:Object;
      
      public var sysApi:SystemApi;
      
      public var tooltipApi:TooltipApi;
      
      public var menuApi:ContextMenuApi;
      
      public var uiApi:UiApi;
      
      public var inventoryApi:InventoryApi;
      
      public var backgroundCtr:GraphicContainer;
      
      private var _timerHide:Timer;
      
      private var _skip:Boolean = true;
      
      private var _item:Object;
      
      private var _equippedItems:Object;
      
      private var _rectangle:Object;
      
      private var _keyIsDown:Boolean = false;
      
      private var _ttOffset:Number;
      
      public function main(oParam:Object = null) : void {
         var isEquippedItem:* = false;
         var item:Object = null;
         var colorStr:* = undefined;
         var tooltipName:String = this.uiApi.me().name;
         this._item = oParam.data;
         if(oParam.autoHide)
         {
            this._timerHide = new Timer(2500);
            this._timerHide.addEventListener(TimerEvent.TIMER,this.onTimer);
            this._timerHide.start();
         }
         if(tooltipName == "tooltip_Hyperlink")
         {
            this.uiApi.addComponentHook(this.backgroundCtr,"onRelease");
            this.uiApi.addComponentHook(this.backgroundCtr,"onRollOver");
            this.uiApi.addComponentHook(this.backgroundCtr,"onRollOut");
            this.uiApi.addComponentHook(this.backgroundCtr,"onRightClick");
            this.backgroundCtr.buttonMode = true;
            this.backgroundCtr.useHandCursor = true;
         }
         if(tooltipName.indexOf("tooltip_compare") == -1)
         {
            isEquippedItem = false;
            this._equippedItems = this.inventoryApi.getEquipement();
            for each(item in this._equippedItems)
            {
               if((item) && (item.objectUID == this._item.objectUID))
               {
                  isEquippedItem = true;
                  break;
               }
            }
            this.tooltipApi.place(oParam.position,oParam.point,oParam.relativePoint,oParam.offset);
            if(!isEquippedItem)
            {
               this.sysApi.addHook(KeyUp,this.onKeyUp);
               this.sysApi.addHook(KeyDown,this.onKeyDown);
               if((this.sysApi.isKeyDown(Keyboard.SHIFT)) && (!this._keyIsDown))
               {
                  this.onKeyDown(null,Keyboard.SHIFT);
               }
            }
         }
         else
         {
            colorStr = Api.system.getConfigEntry("colors.grid.title");
            this.backgroundCtr.borderColor = parseInt(colorStr);
         }
      }
      
      public function onKeyUp(target:Object, keyCode:uint) : void {
         if(keyCode == Keyboard.SHIFT)
         {
            this._keyIsDown = false;
            this.hideCompareTooltips();
         }
      }
      
      public function onKeyDown(target:Object, keyCode:uint) : void {
         var i:uint = 0;
         var item:Object = null;
         if((!this._keyIsDown) && (keyCode == Keyboard.SHIFT))
         {
            this._keyIsDown = true;
            _compareTooltips = [];
            this._ttOffset = 7;
            i = 0;
            for each(item in this._equippedItems)
            {
               if(item)
               {
                  if((item.type) && (this._item.type) && (item.type.superTypeId == this._item.type.superTypeId))
                  {
                     _compareTooltips.push("tooltip_compare" + i);
                     this.uiApi.showTooltip(item,new Rectangle(),false,"compare" + i,LocationEnum.POINT_TOPLEFT,LocationEnum.POINT_TOPLEFT,this._ttOffset,"item",null,
                        {
                           "header":true,
                           "description":false,
                           "equipped":true
                        },null,false,4,1,"Ankama_Tooltips");
                     i++;
                  }
               }
            }
            if(_compareTooltips.length > 0)
            {
               if(this.uiApi.getUi(_compareTooltips[_compareTooltips.length - 1]))
               {
                  this.tooltipApi.adjustTooltipPositions(_compareTooltips,"tooltip_standard",this._ttOffset);
               }
               else
               {
                  this.sysApi.addHook(UiLoaded,this.onUiLoaded);
               }
            }
         }
      }
      
      public function onRelease(target:Object) : void {
         this.uiApi.hideTooltip("close_tooltip");
         this.uiApi.hideTooltip(this.uiApi.me().name);
      }
      
      public function onRightClick(target:Object) : void {
         var contextMenu:Object = null;
         if(this._item)
         {
            contextMenu = this.menuApi.create(this._item);
            if(contextMenu.content.length > 0)
            {
               this.modContextMenu.createContextMenu(contextMenu);
            }
         }
      }
      
      public function onRollOver(target:Object) : void {
         this.backgroundCtr.filters = new Array(new GlowFilter(15822352,1,5,5,2,3));
         this.uiApi.showTooltip(this.uiApi.textTooltipInfo(this.uiApi.getText("ui.common.close")),target,false,"close_tooltip",7,1,3,null,null,null,"TextInfo");
      }
      
      public function onRollOut(target:Object) : void {
         this.backgroundCtr.filters = new Array();
         this.uiApi.hideTooltip("close_tooltip");
      }
      
      public function onUiLoaded(name:String) : void {
         if(name == _compareTooltips[_compareTooltips.length - 1])
         {
            this.tooltipApi.adjustTooltipPositions(_compareTooltips,"tooltip_standard",this._ttOffset);
            this.sysApi.removeHook(UiLoaded);
         }
      }
      
      private function onTimer(e:TimerEvent) : void {
         this._timerHide.removeEventListener(TimerEvent.TIMER,this.onTimer);
         this.uiApi.hideTooltip(this.uiApi.me().name);
      }
      
      private function hideCompareTooltips() : void {
         var tooltipName:String = null;
         if(_compareTooltips)
         {
            for each(tooltipName in _compareTooltips)
            {
               this.uiApi.hideTooltip(tooltipName.replace("tooltip_",""));
            }
            _compareTooltips = null;
         }
      }
      
      public function unload() : void {
         if(this._keyIsDown)
         {
            this.hideCompareTooltips();
         }
         this.sysApi.removeHook(KeyUp);
         this.sysApi.removeHook(KeyDown);
         this.sysApi.removeHook(UiLoaded);
         this._equippedItems = null;
         this._item = null;
         if(this._timerHide)
         {
            this._timerHide.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timerHide.stop();
            this._timerHide = null;
         }
      }
   }
}
