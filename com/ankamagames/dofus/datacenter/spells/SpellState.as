﻿package com.ankamagames.dofus.datacenter.spells
{
    import com.ankamagames.jerakine.interfaces.IDataCenter;
    import com.ankamagames.jerakine.data.GameData;
    import com.ankamagames.jerakine.data.I18n;

    public class SpellState implements IDataCenter 
    {

        public static const MODULE:String = "SpellStates";

        public var id:int;
        public var nameId:uint;
        public var preventsSpellCast:Boolean;
        public var preventsFight:Boolean;
        public var isSilent:Boolean;
        private var _name:String;


        public static function getSpellStateById(id:int):SpellState
        {
            return ((GameData.getObject(MODULE, id) as SpellState));
        }

        public static function getSpellStates():Array
        {
            return (GameData.getObjects(MODULE));
        }


        public function get name():String
        {
            if (!(this._name))
            {
                this._name = I18n.getText(this.nameId);
            };
            return (this._name);
        }


    }
}//package com.ankamagames.dofus.datacenter.spells

