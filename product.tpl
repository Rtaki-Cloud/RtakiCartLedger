<!-- 由锐泷云开发 · 主题定制与适配 | 官网：https://www.rtaki.com/ | QQ：1614074517 | 邮箱：support@rtaki.com | 模板：cart/RtakiCartLedger/product.tpl -->
<link rel="stylesheet" href="/themes/cart/RtakiCartLedger/assets/rtaki/cart.css?v={$Ver}-20261003r4">
<div class="rtaki-cart rtaki-cart-ledger" data-rtaki-cart="ledger">
  <div class="rtaki-catalog">
    {include file="cart/RtakiCartLedger/sidebar-categories"}
    <section class="rtaki-catalog-content">
      <header class="rtaki-catalog-head">
        <div><h2>{if $Get.keywords}{$Lang.search}：{$Get.keywords|htmlspecialchars}{else}{$Cart.product_groups_checked.name|htmlspecialchars}{/if}</h2>
        <p>{$Cart.product_groups_checked.headline|htmlspecialchars}</p></div>
        <form action="/cart" method="get" class="rtaki-product-search" role="search">
          <input type="hidden" name="action" value="product">
          {if $Get.fid}<input type="hidden" name="fid" value="{$Get.fid|htmlspecialchars}">{/if}
          {if $Get.gid}<input type="hidden" name="gid" value="{$Get.gid|htmlspecialchars}">{/if}
          {if $Get.site}<input type="hidden" name="site" value="{$Get.site|htmlspecialchars}">{/if}
          <input type="search" name="keywords" value="{$Get.keywords|htmlspecialchars}" aria-label="{$Lang.search_products}" placeholder="{$Lang.search_products}">
          <button type="submit">{$Lang.search}</button>
        </form>
      </header>
      {if $Cart.product_groups_checked.tagline}<div class="rtaki-catalog-note">{$Cart.product_groups_checked.tagline|htmlspecialchars}</div>{/if}
      {if $Cart.products}
      <div class="rtaki-products">
        {foreach $Cart.products as $list}
        <article class="rtaki-product">
          <header class="rtaki-product-head"><h3><i class="bx bx-server" aria-hidden="true"></i>{$list.name|htmlspecialchars}</h3>{if $list.stock_control==1}<span class="rtaki-stock">{$Lang.stock}：{$list.qty}</span>{/if}</header>
          <div class="rtaki-product-description">{$list.description|raw}</div>
          <footer class="rtaki-product-bottom">
            <div class="rtaki-price"><span>{$Cart.currency.prefix}</span><strong>{if $list.has_bates}{$list.sale_price}{else}{$list.product_price}{/if}</strong><small>{$Lang.rise} / {$list.billingcycle_zh|htmlspecialchars}</small></div>
            {if $list.has_bates}<div class="rtaki-original-price">{$Lang.original_price}：<s>{$Cart.currency.prefix}{$list.product_price}</s> / {$list.billingcycle_zh|htmlspecialchars}</div>{/if}
            {if $list.ontrial==1}<div class="rtaki-trial">{$Lang.on_trial} {$list.ontrial_cycle}{$list.ontrial_cycle_type == 'day' ? $Lang.day : $Lang.hour}：{$Cart.currency.prefix}{$list.ontrial_setup_fee+$list.ontrial_price}</div>{/if}
            {if $list.stock_control==1 && $list.qty<1}<button type="button" class="rtaki-buy" disabled>已售罄</button>{else}<a href="/cart?action=configureproduct&amp;pid={$list.id}{if $Get.site}&amp;site={$Get.site|urlencode}{/if}" class="rtaki-buy">{$Lang.buy_now}</a>{/if}
          </footer>
        </article>
        {/foreach}
      </div>
      <nav class="rtaki-cart-pages" aria-label="商品分页"><ul class="pagination pagination-sm">{$Pages}</ul></nav>
      {else}<div class="rtaki-cart-empty">{$Lang.no_data_available}</div>{/if}
    </section>
  </div>
</div>
<script src="/themes/cart/RtakiCartLedger/assets/rtaki/cart.js?v={$Ver}-20261003r4"></script>
