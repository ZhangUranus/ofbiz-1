	   <ul class="displayList cartItemList shippingGroupSummary">
	    <li class="container shipAddress shippingGroupSummaryShipAddress firstRow">
		  <div>
	        <label>${uiLabelMap.ShippingToLabel}</label>
		      <#assign contactMech = delegator.findByPrimaryKeyCache("ContactMech", Static["org.ofbiz.base.util.UtilMisc"].toMap("contactMechId", shipGroup.contactMechId))?if_exists />
		      <#if contactMech?has_content>
		          <#assign postalAddress = contactMech.getRelatedOneCache("PostalAddress")?if_exists />
				    ${setRequestAttribute("PostalAddress", postalAddress)}
				    ${setRequestAttribute("DISPLAY_FORMAT", "MULTI_LINE_FULL_ADDRESS")}
				    ${screens.render("component://osafe/widget/CommonScreens.xml#displayPostalAddress")}
		      </#if>
	      </div>
	    </li>
	   </ul>
	   <ul class="displayList cartItemList shippingGroupSummary">
	    <li class="container shipOption shippingGroupSummaryShipOption firstRow">
		  <div>
	        <label>${uiLabelMap.ShippingMethodLabel}</label>
            <#assign carrierGroupName =""/>
            <#assign carrierPartyId = shipGroup.carrierPartyId!""/>
	        <#assign carrierParty = shipGroup.getRelatedOne("CarrierParty")!""/>
	        <#if carrierParty?has_content>
   	            <#assign carrierPartyGroup = carrierParty.getRelatedOne("PartyGroup")!""/>
   	            <#if carrierPartyGroup?has_content>
                    <#assign carrierGroupName =carrierPartyGroup.groupName!""/>
   	            </#if>
	        </#if>
            <#assign shipMethodTypeDescription =""/>
	        <#assign shipMethodTypeId = shipGroup.shipmentMethodTypeId!""/>
	        <#assign shipMethodType = shipGroup.getRelatedOne("ShipmentMethodType")!""/>
   	        <#if shipMethodType?has_content>
               <#assign shipMethodTypeDescription =shipMethodType.description!""/>
   	        </#if>
	        
	        <span>${carrierGroupName!carrierPartyId!}</span>
	        <span>${shipMethodTypeDescription!shipMethodTypeId!}</span>
	     </div>
	    </li>
	   </ul>

