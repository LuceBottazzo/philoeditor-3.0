<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
	<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
	<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
	<TEI xmlns="http://www.tei-c.org/ns/1.0">
	  <!-- solo per l'edizione critica -->
	  <teiHeader>
	      <fileDesc>
	         <!-- si fa per l'opera -->
	         <titleStmt>
	            <title>Le avventure di Pinocchio.Storie di un burattino</title>
	            <author>Carlo Collodi</author>
	         </titleStmt>
	         <editionStmt>
	            <edition>Edizione collaborativa</edition>
	            <!-- un respStmt per ogni contributo. E' corretto? boh chi lo sa™. respStmt in un template-->
	            $resp
	            <!--LISTA DI ISTANZE (?) DEL TEMPLATE
	            <respStmt xml:id=$id>
	               <resp>$resp</resp>
	               <name>$name</name>
	            </respStmt>
	            
	            !-->
	         </editionStmt>
	         <publicationStmt>
	            <publisher>$publisher</publisher>
	            <pubPlace>$pubplace</pubPlace>
	            <date>$date</date>
	            <availability>
	               <licence>$URL</licence>
	            </availability>
	         </publicationStmt>
	         <sourceDesc> <!--NON CHIARO-->
			<bibl xml:id="vVolume">
			    <author>Ornella Castellani Pollidori</author>
			    <title>Le avventure di Pinocchio / Carlo Collodi ; edizione critica a cura di Ornella Castellani Pollidori</title>
			    <pubPlace>Pescia,PT</pubPlace>
			    <publisher>Fondazione nazionale Carlo Collodi</publisher>
			    <date>1983</date>
			</bibl>
			<bibl xml:id="VRivista">
			   <author>Carlo Collodi</author>
			    <title>Storie di un burattino</title>
			    <pubPlace>Roma</pubPlace>
			    <publisher>Giornale per bambini</publisher>
			    <date>1881-1883</date>
			</bibl>
	         </sourceDesc>    
		 </fileDesc>
	     <encodingDesc>
	        <p>$encoding</p> 
	     </encodingDesc><!--COSA CI DEVE ANDARE? CODIFICA DEI CARATTERI? LO CHIEDO NEL FORM?--> 
	     <revisionDesc>
		$change
	     </revisionDesc>
	  </teiHeader>
	  <text>	
		<body>
			<div type="chapter" xml:id="$cap">
				<xsl:for-each select=".//p">
				<p>
       					<xsl:attribute name="xml:id">p<xsl:number/></xsl:attribute>
    					<xsl:for-each select="./span">
    						<xsl:choose>
    						<xsl:when test="contains(@class,'nochange')">
    	    						<xsl:value-of select="."/>
   	   					</xsl:when>
    						<xsl:when test="contains(@class,'replace')">
    	     						<app>
    	     							<xsl:attribute name="type"><xsl:value-of select="replace(./@class,' ','-')"/></xsl:attribute>
    	          						<rdg source="#vRivista">
									<xsl:choose>
										<xsl:when test="./@data-responsible">
    	     										<xsl:attribute name="resp">#<xsl:value-of select="./@data-responsible"/></xsl:attribute>
										</xsl:when>
										<xsl:otherwise>
    	     										<xsl:attribute name="resp">#void</xsl:attribute>
										</xsl:otherwise>
									</xsl:choose>
    	    								<xsl:value-of select="./span[@class='oldVersion']"/>
    	          						</rdg>
    	      							<rdg source="#vVolume">
									<xsl:choose>
										<xsl:when test="./@data-responsible">
    	     										<xsl:attribute name="resp">#<xsl:value-of select="./@data-responsible"/></xsl:attribute>
										</xsl:when>
										<xsl:otherwise>
    	     										<xsl:attribute name="resp">#void</xsl:attribute>
										</xsl:otherwise>
									</xsl:choose>
    	    								<xsl:value-of select="./span[contains(@class,'newVersion')]"/>
        	      						</rdg>
        	 					</app>
   	   					</xsl:when>
   	   					</xsl:choose>
   	 				</xsl:for-each>
   	  			</p>
   	 			</xsl:for-each>
  			</div>
	     	</body>
	</text>	
</TEI>
</xsl:template>
</xsl:stylesheet>
