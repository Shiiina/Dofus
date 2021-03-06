﻿package com.ankamagames.jerakine.resources.adapters.impl
{
    import com.ankamagames.jerakine.resources.adapters.AbstractLoaderAdapter;
    import com.ankamagames.jerakine.resources.adapters.IAdapter;
    import flash.display.LoaderInfo;
    import com.ankamagames.jerakine.resources.ResourceType;

    public class SwfAdapter extends AbstractLoaderAdapter implements IAdapter 
    {


        override protected function getResource(ldr:LoaderInfo)
        {
            return (ldr.loader.content);
        }

        override public function getResourceType():uint
        {
            return (ResourceType.RESOURCE_SWF);
        }


    }
}//package com.ankamagames.jerakine.resources.adapters.impl

