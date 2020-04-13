{**
 * 2007-2016 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
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
 * @copyright 2007-2016 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
 
<div class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
  {*<div class="thumbnail-container">*}
  {block name='product_thumbnail'}
 
 <div>
  {if empty($product.cover.bySize.home_default.url)}
        <a href="{$product.url}" class="thumbnail product-thumbnail">
          <img
            src = "{$urls.shop_domain_url}/img/p/fr-default-large_default.jpg"
            alt = "{$product.cover.legend}"
            data-full-size-image-url = "{$product.cover.large.url}">
        </a> 
        {else}
        <a href="{$product.url}" class="thumbnail product-thumbnail">
          <img
            src = "{$product.cover.bySize.home_default.url}"
            alt = "{$product.cover.legend}"
            data-full-size-image-url = "{$product.cover.large.url}" >
        </a>
          {/if} 
  
  
	    {***block name='product_thumbnail'}
	      <a href="{$product.url}" class="thumbnail product-thumbnail">
	        <img
	          src = "{$product.cover.bySize.home_default.url}"
	          alt = "{$product.cover.legend}"
	          data-full-size-image-url = "{$product.cover.large.url}"> *}
	          
	          
	        {if count($product.images) > 1 }
         {hook h="displayTmHoverImage" id_product=$product.id_product home='home_default' large='large_default'}
       {/if}
	      </a>
	    {/block}
		
		{block name='quick_view'}
			<a href="#" class="quick-view" data-link-action="quickview">
				<i class="material-icons search">&#xE417;</i> {l s='' d='Shop.Theme.Actions'}
			</a>
		{/block}
			
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
		        <h3 class="h3 product-title" itemprop="name" title="{$product.name}"><a href="{$product.url}">{$product.name|truncate:52:'...'}</a></h3>
		      {/block}

		      {block name='product_price_and_shipping'}
		        {if $product.show_price}
		          <div class="product-price-and-shipping">
		           <span itemprop="price" class="price">{$product.price}</span>
		            {if $product.has_discount}
		              {hook h='displayProductPriceBlock' product=$product type="old_price"}
		              {if $product.discount_type === 'percentage'}
		                <span class="discount-percentage">{$product.discount_percentage}</span>
		              {/if}
		               <span class="regular-price">{$product.regular_price}</span>
		            {/if}

		            {hook h='displayProductPriceBlock' product=$product type="before_price"}

		            {hook h='displayProductPriceBlock' product=$product type='unit_price'}

		            {hook h='displayProductPriceBlock' product=$product type='weight'}
		          </div>
		        {/if}
		      {/block}		    	
		    	
		    	{block name='product_buy'}
				{*if !$configuration.is_catalog}				
					<div class="product-actions">
						  <form action="{$urls.pages.cart}" method="post" class="add-to-cart-or-refresh">
							<input type="hidden" name="token" value="{$static_token}">
							<input type="hidden" name="id_product" value="{$product.id}" class="product_page_product_id">
							<input type="hidden" name="id_customization" value="0" class="product_customization_id">
							<button class="btn btn-primary add-to-cart" data-button-action="add-to-cart" type="submit" {if 
											$product.availability == 'unavailable'}disabled{/if}>
								{l s='Add to cart' d='Shop.Theme.Actions'}
							</button>
						</form>

					</div>
				{/if*}
				{/block}
		    	
		    	
		    {*	<div class="product-actions">
				      <a href="{$product.url}" class="btn btn-primary add-to-cart">
				        {l s='View Detail' d='Shop.Theme.Actions'}
				      </a>
	    		</div>
	    		
				{block name='product_description_short'}
				  <div class="product-detail" itemprop="description">{$product.description_short nofilter}</div>
				{/block} *}

	 	</div>		
		
			<div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
		
			  {block name='product_variants'}
				{if $product.main_variants}
				  {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
				{/if}
			  {/block}
			</div>

</div>
