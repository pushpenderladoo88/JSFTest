<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%-- <f:loadBundle basename="bartenderLabel" var="msg"/> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<LINK href="../css/bartender_style.css" type=text/css rel=stylesheet>
<title>Opened Job Description</title>
</head>
<body>
<f:view>
	<h:form id="openedJobPage">
	
		<%-- <f:subview id="header">
			<%@include file="/../includes/header.jsp"%>
		</f:subview> --%>
               <rich:spacer width="20" height="5"/>
		<table cellpadding="5" cellspacing="0" align="center" width="100%"  bgcolor="#F2F2F2"
			height="100%">
			<tr height="10%" valign="top">
				<td align="left"
					style="BORDER-TOP: #B6B6B6 1px solid; BORDER-RIGHT: #B6B6B6 1px solid; BORDER-LEFT: #B6B6B6 1px solid; BORDER-BOTTOM: #B6B6B6 1px solid">
					<a4j:outputPanel id = "error" ajaxRendered="true">
						<h:panelGrid width="100%" styleClass="column_class5">
							<h:messages globalOnly="true" style="color:red" styleClass="jsf-output-text" />
						</h:panelGrid>
					</a4j:outputPanel>
				<table width="100%" bgcolor="#3B73B9" frame="box"
					bordercolor="#B6B6B6">
					<tr>
						<td align="left">
						<h:outputText styleClass="jsf-output-header" value="Selected Job Details for " /></td>
					</tr>
				</table>
				<br>
				
				<div align = "center">
				<h:panelGrid columns="2" columnClasses="column_class300, column_class600" width="100%" border="1">
					<h:panelGroup styleClass="panel_class">
					<h:panelGroup styleClass="panel_class">
					<div style="overflow: scroll;width: 100%; height: 300px;">
						<%-- <rich:tree value="folder table" var="nodes" showConnectingLines="true" style="width:95%" >
						    <rich:treeNode reRender="rvsnHstryTable,folderTableTable,attTable">
						    <h:commandLink  value="test" >
						    <f:param value="#{nodes.sequenceID}" name="templateTableID" />
						    </h:commandLink>
						    </rich:treeNode>
						</rich:tree> --%>
						</div>
						</h:panelGroup>
					<h:panelGroup styleClass="panel_class">
						<div style="overflow: scroll;width: 100%; height: 250px;">
						<%-- <rich:dataTable id="attTable" width="95%" rowKeyVar="rowIndex" rows="" rowClasses="alterNate1,alterNate2"
						columnsWidth="50%,50%" headerClass="table_header"
						value="#{jobSearchMB.folderAttributeTableList}" var="result" style="text-align:center">
							<rich:column>
								<f:facet name="header"><h:outputText value="#{msg.LABEL_ATTRIBUTE_NAME}" /></f:facet>
								<h:outputText value="#{result.folderAttributeName}" styleClass="jsf-output-value"/>
							</rich:column>
							<rich:column>
								<f:facet name="header"><h:outputText value="#{msg.LABEL_ATTRIBUTE_VALUE}" /></f:facet>
								<h:outputText value="#{result.folderAttributeValue}" styleClass="jsf-output-value"/>
							</rich:column>
						</rich:dataTable> --%>
						<rich:dataTable id="attTable" width="95%" rowKeyVar="rowIndex" rows="" rowClasses="alterNate1,alterNate2"
						columnsWidth="50%,50%" headerClass="table_header"
						var="result" style="text-align:center">
							<rich:column>
								<f:facet name="header"><h:outputText value="Attribute Name" /></f:facet>
								<h:outputText value="Attribute Name" styleClass="jsf-output-value"/>
							</rich:column>
							<rich:column>
								<f:facet name="header"><h:outputText value="Attribute Value" /></f:facet>
								<h:outputText value="Attribute Name" styleClass="jsf-output-value"/>
							</rich:column>
						</rich:dataTable>
						</div>
						<h:panelGrid width="100%" styleClass="column_class5">
							<h:panelGroup>
							<h:commandButton value="BUTTON_PRINT_PDF" styleClass="button" action="#" ></h:commandButton>
	            			</h:panelGroup>
						</h:panelGrid>
					</h:panelGroup>
					</h:panelGroup>
					<h:panelGroup styleClass="wide_panel_class">
					<a4j:outputPanel id = "sortError" ajaxRendered="true">
					<h:panelGrid width="100%" styleClass="column_class5">
					<h:outputText value="Selected Folder has been sent for Printing" style="color:red" styleClass="jsf-output-text" />
					<h:outputText value="Selected Folder Table has been sent for Printing" style="color:red" styleClass="jsf-output-text" />
					</h:panelGrid>
				</a4j:outputPanel>
				<br/>
					<div style="overflow: scroll;width: 900px; height: 500px;">
					<h:outputText value="Revision History for " styleClass="jsf-output-text" 
					style="text-align:center" />
					<br/>
						<rich:dataTable id="rvsnHstryTable" width="98%" rowKeyVar="rowIndex" rows="" rowClasses="alterNate1,alterNate2"
						columnsWidth="10%,15%,45%,15%,15%" headerClass="table_header" 
						 var="result" style="text-align:center">
							<rich:column>
								<f:facet name="header"><h:outputText value="{msg.LABEL_SEQ}" /></f:facet>
								<h:outputText value="{result.sequenceID}" styleClass="jsf-output-value"/>
							</rich:column>
							<rich:column>
								<f:facet name="header"><h:outputText value="{msg.LABEL_STATUS}" /></f:facet>
								<h:outputText value="{result.jobStatus}" styleClass="jsf-output-value"/>
							</rich:column>
							<rich:column>
								<f:facet name="header"><h:outputText value="{msg.LABEL_COMMENT}" /></f:facet>
								<h:outputText value="{result.revisionComment}" styleClass="jsf-output-value"/>
							</rich:column>
							<rich:column>
								<f:facet name="header"><h:outputText value="{msg.LABEL_BY}" /></f:facet>
								<h:outputText value="{result.revisedBy.prsnFullName}" styleClass="jsf-output-value"/>
							</rich:column>
							<rich:column>
								<f:facet name="header"><h:outputText value="{msg.LABEL_DATE}" /></f:facet>
								<h:outputText value="{result.dateInMonDdYyyy}" styleClass="jsf-output-value"/>
							</rich:column>
						</rich:dataTable>
						
						<rich:dataTable value="{jobSearchMB.columnValues}" var="colVals" width="100%"  id="folderTableTable">

          				 <f:facet name="header">
              			 <h:outputText value="{jobSearchMB.folderName}/{jobSearchMB.folderTableName}"></h:outputText>
           				 </f:facet>
           
           				<rich:column >
                
               			<f:facet name="header">
                   		<h:outputText value="{columns}" />
               			</f:facet>
           
              			 <h:outputText value="{colVals[ind].entityValue} " />
          			  </rich:column>
          			  <rich:column >
                
               			<f:facet name="header">
                   		<h:outputText value="{columns}" />
               			</f:facet>
           
              			 <h:outputText value="{colVals[ind].entityValue} " />
          			  </rich:column>
          			  <rich:column >
                
               			<f:facet name="header">
                   		<h:outputText value="{columns}" />
               			</f:facet>
           
              			 <h:outputText value="{colVals[ind].entityValue} " />
          			  </rich:column>
          			  <rich:column >
                
               			<f:facet name="header">
                   		<h:outputText value="{columns}" />
               			</f:facet>
           
              			 <h:outputText value="{colVals[ind].entityValue} " />
          			  </rich:column>
          			  <rich:column >
                
               			<f:facet name="header">
                   		<h:outputText value="{columns}" />
               			</f:facet>
           
              			 <h:outputText value="{colVals[ind].entityValue} " />
          			  </rich:column>
        			</rich:dataTable>
        			<br/>
					</div>
					<h:panelGroup>
					<h:panelGrid width="100%" styleClass="column_class5">
				<h:panelGroup>
				<h:commandButton value="{msg.BUTTON_PRINT_AS_IS}" styleClass="button"  ></h:commandButton>
				&nbsp;&nbsp;
				<h:commandButton value="{msg.BUTTON_CUSTOMIZE_PRINT}" styleClass="button"  ></h:commandButton>
				&nbsp;&nbsp;
				<h:commandButton value="{msg.BUTTON_BACK_SEARCH_RESULT}" styleClass="button" ></h:commandButton>
	            </h:panelGroup>
				</h:panelGrid>
					
					</h:panelGroup>
					</h:panelGroup>
				</h:panelGrid>
				</div></td>
			</tr>
		</table>
		
		<br>
		<br>
		
		<%-- <f:subview id="footer">
			<%@include file="/../includes/footer.jsp"%>
		</f:subview> --%>
		</h:form>
	<rich:modalPanel width="110" height="110" zindex="2000"
		style="align:center" id="progressBarPanel">
		<h:graphicImage url="/images/ajax-loader.gif" />
	</rich:modalPanel>
	<a4j:status onstart="Richfaces.showModalPanel('progressBarPanel')"
		onstop="Richfaces.hideModalPanel('progressBarPanel')" />

</f:view>
</body>
</html>