<li class="${request.getAttribute("attributeClass")!}<#if lineIndex == 0> firstRow</#if>">
  <div>
    <label>${uiLabelMap.CartItemPriceCaption}</label>
    <span><@ofbizCurrency amount=displayPrice isoCode=currencyUom rounding=globalContext.currencyRounding/></span>
  </div>
</li>
