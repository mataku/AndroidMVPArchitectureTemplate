<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>

    <merge from="res/values/strings.xml"
      to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
    <#include "../common/recipe_manifest.xml.ftl" />
  <@kt.addAllKotlinDependencies />

    <dependency mavenUrl="com.squareup.okhttp3:logging-interceptor:3.+" gradleConfiguration="implementation" />
    <dependency mavenUrl="com.squareup.okhttp3:okhttp:3.+" gradleConfiguration="implementation" />
    <dependency mavenUrl="com.squareup.retrofit2:retrofit:2.+" gradleConfiguration="implementation" />

<#if generateLayout>
    <#include "../common/recipe_simple.xml.ftl" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
</#if>

    <instantiate from="root/src/app_package/SimpleActivity.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.${ktOrJavaExt}" />
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.${ktOrJavaExt}" />

</recipe>
