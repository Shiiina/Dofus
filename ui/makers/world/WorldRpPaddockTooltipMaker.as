﻿package makers.world
{
    import blocks.mount.PaddockWithGuildBlock;
    import blocks.mount.PaddockWithPriceBlock;
    import d2hooks.*;

    public class WorldRpPaddockTooltipMaker 
    {


        public function createTooltip(data:*, param:Object):Object
        {
            var tooltip:Object = Api.tooltip.createTooltip("chunks/base/base.txt", "chunks/base/container.txt", "chunks/base/empty.txt");
            var infos:Object = new Object();
            infos.maxItems = data.maxItems;
            infos.maxMounts = data.maxOutdoorMount;
            if (data.hasOwnProperty("price"))
            {
                infos.price = data.price;
            };
            if (((data.hasOwnProperty("guildIdentity")) && (data.guildIdentity)))
            {
                infos.guildIdentity = data.guildIdentity;
                infos.guildName = data.guildIdentity.guildName;
                tooltip.addBlock(new PaddockWithGuildBlock(infos).block);
            }
            else
            {
                tooltip.addBlock(new PaddockWithPriceBlock(infos).block);
            };
            return (tooltip);
        }


    }
}//package makers.world

