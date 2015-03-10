import java.io.File;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class CreateDom {

	public static void main(String[] args) throws Exception {

		File xmlFile = new File("master-gen.xml");

		Document docDataXml = DocumentBuilderFactory.newInstance()
				.newDocumentBuilder().parse(xmlFile);

		Document docOutXml = DocumentBuilderFactory.newInstance()
				.newDocumentBuilder().newDocument();

		// Récupère tous les éléments ue
		NodeList nList = docDataXml.getDocumentElement().getElementsByTagName(
				"ue");

		Element racine = docOutXml.createElement("liste_unites");

		// Ajout de noeuds
		for (int i = 0; i < nList.getLength(); i++) {

			Node nNode = nList.item(i);
			Node ue = racine.appendChild(docOutXml.createElement("ue"));
			ue.appendChild(docOutXml.createTextNode(((Element) nNode)
					.getElementsByTagName("nom_ue").item(0).getTextContent()));

		}

		docOutXml.appendChild(racine);

		// Serialization
		TransformerFactory myFactory = TransformerFactory.newInstance();
		Transformer transformer = myFactory.newTransformer();
		transformer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
		transformer.setOutputProperty(OutputKeys.METHOD, "xml");

		transformer.transform(new DOMSource(docOutXml), new StreamResult(
				System.out));

	}

}