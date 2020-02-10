package com.pe.ibm.ws;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Base64;

import org.apache.commons.io.IOUtils;

import com.ibm.watson.developer_cloud.text_to_speech.v1.TextToSpeech;
import com.ibm.watson.developer_cloud.text_to_speech.v1.model.AudioFormat;
import com.ibm.watson.developer_cloud.text_to_speech.v1.model.CustomVoiceModel;
import com.ibm.watson.developer_cloud.text_to_speech.v1.model.Voice;

public class WatsonTextToVoice {

	public String transformationTextToVoice(String strInput) throws IOException {
	    TextToSpeech service = new TextToSpeech();
	    service.setUsernameAndPassword("49118183-39eb-42e3-b862-28b533bb2ed8", "JjM80RYKL1Ly");
	    
	    // create custom voice model.
	    CustomVoiceModel customVoiceModel = service.createCustomVoiceModel("demoIBM", "es-ES", "Demo Watson hablando").execute();
	    System.out.println(customVoiceModel);
	    
//	    // list custom voice models for ES.
//	    List<CustomVoiceModel> customVoiceModels = service.getCustomVoiceModels("es-ES").execute();
//	    System.out.println(customVoiceModels);
//	    
//	    // update custom voice model.
//	    customVoiceModel.setName("demoIBM Update");
//	    customVoiceModel.setDescription("Este Demo Watson hablando Update");
//	    service.updateCustomVoiceModel(customVoiceModel).execute();
//	    
//	    // list custom voice models regardless of language.
//	    customVoiceModels = service.getCustomVoiceModels(null).execute();
//	    System.out.println(customVoiceModels);
//	    
//	    // create multiple custom word translations
//	    CustomTranslation customTranslation1 = new CustomTranslation("habla", "hola");
//	    CustomTranslation customTranslation2 = new CustomTranslation("plz", "please");
//	    service.addWords(customVoiceModel, customTranslation1, customTranslation2).execute();
//
//	    // create a single custom word translation
//	    service.addWord(customVoiceModel, new CustomTranslation("nat", "and that")).execute();
//
//	    // get custom word translations
//	    List<CustomTranslation> words = service.getWords(customVoiceModel).execute();
//	    System.out.println(words);
//
//	    // get custom word translation
////	    CustomTranslation translation = service.getWord(customVoiceModel, "hodor").execute();
////	    System.out.println(translation);

	    // synthesize with custom voice model
	    String text = "Hola Manuel, es un gusto saludarte, soy Watson y me acabas de hacer hablar, buen trabajo!";
	    InputStream in = service.synthesize(strInput, Voice.ES_LAURA, AudioFormat.WAV, customVoiceModel.getId()).execute();
//	    writeToFile(WaveUtils.reWriteWaveHeader(in), new File("output.wav"));
	    String strVoice = getStringFromInputStream(in);

//	    // delete custom words with object and string
//	    service.deleteWord(customVoiceModel, customTranslation1);
//	    service.deleteWord(customVoiceModel, customTranslation2.getWord());

//	    // delete custom voice model
//	    service.deleteCustomVoiceModel(customVoiceModel).execute();

//	    // list custom voice models regardless of language.
//	    customVoiceModels = service.getCustomVoiceModels(null).execute();
//	    System.out.println(customVoiceModels);
	    System.out.println(strVoice);
	    return strVoice;
	  }

	  private void writeToFile(InputStream in, File file) {
	    try {
	      OutputStream out = new FileOutputStream(file);
	      byte[] buf = new byte[1024];
	      int len;
	      while ((len = in.read(buf)) > 0) {
	        out.write(buf, 0, len);
	      }
	      out.close();
	      in.close();
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	  }
	  
	// convert InputStream to String
		private String getStringFromInputStream(InputStream is) {

			BufferedReader br = null;
			StringBuilder sb = new StringBuilder();
			String resultBase64Encoded = "";
			
			String line;
			try {
				
				byte[] bytes = IOUtils.toByteArray(is);

				resultBase64Encoded = Base64.getEncoder().encodeToString(bytes);
//			resultBase64Encoded = Base64.getEncoder().encodeToString(sb.toString().getBytes("utf-8"));


			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (br != null) {
					try {
						br.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}

			return resultBase64Encoded;

		}
	
}
