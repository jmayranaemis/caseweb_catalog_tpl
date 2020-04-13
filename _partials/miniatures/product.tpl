{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
 {block name='product_miniature_item'}
<div class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope 

itemtype="http://schema.org/Product">
  {*<div class="thumbnail-container">*} <!-- suppression de la classe pour enlever l'ecart entre l'image et le texte sur le produit -->
	   <div>
	    {block name='product_thumbnail'}
      	{if empty($product.cover.bySize.home_default.url)}
        <a href="{$product.url}" class="thumbnail product-thumbnail">
          <img
            src = "http://devcase.cash-alimentaire.com/img/p/fr.jpg"
            alt = "{$product.cover.legend}"
            data-full-size-image-url = "{$product.cover.large.url}"
          >
        </a>    
     	 {else}
        <a href="{$product.url}" class="thumbnail product-thumbnail">
          <img
            src = "{$product.cover.bySize.home_default.url}"
            alt = "{$product.cover.legend}"
            data-full-size-image-url = "{$product.cover.large.url}"
          >
        </a>
        {/if}
      	{/block}
	    
	    {*block name='quick_view'}
			<a href="#" class="quick-view" data-link-action="quickview">
				<i class="material-icons search">&#xE417;</i> {l s='Quick view' d='Shop.Theme.Actions'}
			</a>
		{/block*}
		
		{block name='product_flags'}
		  <ul class="product-flags">
			{foreach from=$product.flags item=flag}
			  <li class="{$flag.type}">{$flag.label}</li>
			{/foreach}
		  </ul>
		{/block}
	
		</div>

    <div class="product-description">
	      {block name='product_name'}
	        <span class="h3 product-title" itemprop="name" title="{$product.name}"><a href="{$product.url}">{$product.name|truncate:100:'...'}</a></span>
	      {/block}

		      {block name='product_price_and_shipping'}
		        {if $product.show_price}
		          <div class="product-price-and-shipping">
  				  <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>  
		          <span itemprop="price" class="price">{$product.price}</span>
		            {if $product.has_discount}
		              {hook h='displayProductPriceBlock' product=$product type="old_price"}
		              {if $product.discount_type === 'percentage'}
		                <span class="discount-percentage">{$product.discount_percentage}</span>
		                
				{* ### Debug template 31.07.19 ### n'affiche pas le prix barré ###
				{elseif $product.discount_type === 'amount'}
                  <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span> *}
		              {/if}
				            <span class="regular-price">{$product.regular_price}</span>
		            {/if}
		            {hook h='displayProductPriceBlock' product=$product type="before_price"}
		            
				{* ### Debug template 31.07.19 ### Affiche un prix barré sur les listes de produits best products et/ou products slider ###
					<span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
		            <span class="regular-price">{$product.regular_price}</span> *}
            
            		{hook h='displayProductPriceBlock' product=$product type='unit_price'}

		   		 	{hook h='displayProductPriceBlock' product=$product type='weight'}
		          
		          </div>
		          
		        {/if}
		      {/block}
    	
			{*{block name='product_buy'}
				{if !$configuration.is_catalog}				
					<div class="product-actions">
						  <form action="{$urls.pages.cart}" method="post" class="add-to-cart-or-refresh">
							<input type="hidden" name="token" value="{$static_token}">
							<input type="hidden" name="id_product" value="{$product.id}" class="product_page_product_id">
							<input type="hidden" name="id_customization" value="0" class="product_customization_id">
							<button class="btn btn-primary add-to-cart" data-button-action="add-to-cart" type="submit" {if 
								$product.availability == 'unavailable'}disabled{/if}>
								l s='Add to cart' d='Shop.Theme.Actions'
							</button>
						</form>

					</div>
				{/if}
			{/block}*}
                        {block name='product_reviews'}
                            {hook h='displayProductListReviews' product=$product}
                        {/block}
                     
	
				<div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
		
			  {block name='product_variants'}
				{if $product.main_variants}
				  {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
				{/if}
			  {/block}

		 </div>
	</div>
</div>
{/block}