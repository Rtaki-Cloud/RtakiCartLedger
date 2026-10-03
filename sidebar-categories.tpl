<!-- 由锐泷云开发 · 主题定制与适配 | 官网：https://www.rtaki.com/ | QQ：1614074517 | 邮箱：support@rtaki.com | 模板：cart/RtakiCartLedger/sidebar-categories.tpl -->
<nav class="rtaki-categories" id="rtaki-cart-categories" aria-label="商品分类">
  {if $Cart.product_groups}
  <div class="rtaki-filter-row"><span>产品类型</span><div class="rtaki-category-types">
  {foreach $Cart.product_groups as $firstIndex=>$groups}
    <a class="{if ($Get.fid == $groups.id) || (!$Get.fid && $firstIndex==0)}is-active{/if}" href="/cart?fid={$groups.id}{if $groups.second}&amp;gid={$groups.second.0.id}{/if}{if $Get.site}&amp;site={$Get.site|urlencode}{/if}">{$groups.name|htmlspecialchars}</a>
  {/foreach}
  </div></div>
  {foreach $Cart.product_groups as $firstIndex=>$groups}
  {if ($Get.fid == $groups.id) || (!$Get.fid && $firstIndex==0)}
  <div class="rtaki-filter-row"><span>区域 / 分类</span><div class="rtaki-category-regions">
    {foreach $groups.second as $secondIndex=>$second}
      <a class="{if ($Get.gid == $second.id) || (!$Get.gid && $secondIndex==0)}is-active{/if}" href="/cart?fid={$groups.id}&amp;gid={$second.id}{if $Get.site}&amp;site={$Get.site|urlencode}{/if}">{$second.name|htmlspecialchars}</a>
    {/foreach}
  </div></div>
  {/if}{/foreach}
  {else}<div class="rtaki-cart-empty">{$Lang.no_data_available}</div>{/if}
</nav>
