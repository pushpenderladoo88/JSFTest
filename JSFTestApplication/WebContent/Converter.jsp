<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="a4j"  uri="http://richfaces.org/a4j"%>
<%@ taglib prefix="rich"  uri="http://richfaces.org/rich"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Celsius to Fahrenheit Convertor Test</title>
</head>
<body>
<f:view>
  <h:form>
    <h:panelGrid columns="2">
      <h:outputLabel value="Celsius"></h:outputLabel>
      <h:inputText  value="#{temperatureConvertor.celsius}"></h:inputText>
    </h:panelGrid>
    
    <h:panelGrid columns="2" columnClasses="top,top">
    
            <rich:fileUpload fileUploadListener="#{temperatureConvertor.listener}"
                maxFilesQuantity="#{temperatureConvertor.uploadsAvailable}"
                id="upload" onuploadcomplete="">
                 <a4j:support event="onuploadcomplete" reRender="info" />
            </rich:fileUpload>
           <h:panelGroup id="info">
                <rich:panel bodyClass="info">
                    <f:facet name="header">
                        <h:outputText value="Uploaded Files Info" />
                    </f:facet>
                    <h:outputText value="No files currently uploaded"
                        rendered="#{temperatureConvertor.size==0}" />
                    <rich:dataGrid columns="1" value="#{temperatureConvertor.files}"
                        var="file" rowKeyVar="row">
                        <rich:panel bodyClass="rich-laguna-panel-no-header">
                            <h:panelGrid columns="2">
                                <a4j:mediaOutput element="img" mimeType="#{file.mime}"
                                    createContent="#{temperatureConvertor.paint}" value="#{row}"
                                    style="width:100px; height:100px;" cacheable="false">
                                    <f:param value="#{temperatureConvertor.timeStamp}" name="time"/>  
                                </a4j:mediaOutput>
                                <h:panelGrid columns="2">
                                    <h:outputText value="File Name:" />
                                    <h:outputText value="#{file.name}" />
                                    <h:outputText value="File Length(bytes):" />
                                    <h:outputText value="#{file.length}" />
                                </h:panelGrid>
                            </h:panelGrid>
                        </rich:panel>
                    </rich:dataGrid>
                </rich:panel>
                <rich:spacer height="3"/>
                <br />
                <a4j:commandButton action="#{temperatureConvertor.clearUploadData}"
                    reRender="info, upload" value="Clear Uploaded Data"
                    rendered="#{temperatureConvertor.size>0}" />
            </h:panelGroup>
            <h:panelGroup>
            <h:outputLabel  value="Document type" />
            
                       
            <h:inputText  id="attachmentDesc" value="" maxlength="144" />
           </h:panelGroup>
           <h:panelGroup>	
            <h:outputLabel  value="Document Category" />
					<h:selectOneMenu styleClass="selectBoxFont" onchange="" value="test"  id="expCat" disabled="true">
						<f:selectItem itemLabel="Select" itemValue="0" /> 
						<f:selectItems value="#{temperatureConvertor.docCategoryLsit}" />
					</h:selectOneMenu>				
					</h:panelGroup>
					
					 <h:panelGroup>	
            <h:outputLabel  value="Document Classification" />
					<h:selectOneMenu styleClass="selectBoxFont" onchange="" value="test" id="expClf" disabled="true">
						<f:selectItem itemLabel="Select" itemValue="0" />
						<f:selectItems value="#{temperatureConvertor.docClassificationLsit}" />
					</h:selectOneMenu>				
					</h:panelGroup>
        </h:panelGrid>
   
    
    
    <h:commandButton action="#{temperatureConvertor.celsiusToFahrenheit}" value="Calculate"></h:commandButton>
    <h:commandButton action="#{temperatureConvertor.reset}" value="Reset"></h:commandButton>
    <h:messages layout="table"></h:messages>
  </h:form>
  
  
  <h:panelGroup rendered="#{temperatureConvertor.initial!=true}">
  <h3> Result </h3>
  <h:outputLabel value="Fahrenheit "></h:outputLabel>
  <h:outputLabel value="#{temperatureConvertor.fahrenheit}"></h:outputLabel>
  </h:panelGroup>
</f:view>
</body>
</html> 