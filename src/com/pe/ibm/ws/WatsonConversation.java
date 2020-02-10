package com.pe.ibm.ws;

import java.util.Map;

import com.ibm.watson.developer_cloud.conversation.v1.ConversationService;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageRequest;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageResponse;

public class WatsonConversation {
	
	public MessageResponse conversationAPI(String input, Map context) {
//		ConversationService service = new ConversationService(ConversationService.VERSION_DATE_2016_07_11,
//				"e0d68b4a-3700-42b4-9f27-f13c1f823ecd", "EmkLIm2zk5Ge");
		// Credentials of Workspace of Conversation
		// service.setUsernameAndPassword("******************", "****************");
//		MessageRequest newMessage = new MessageRequest.Builder().inputText(input).context(context).build();
//		// Workspace ID of Conversation current workspace
//		String workspaceId = "1675de7d-f1f3-4045-8b70-02f422f6bdb2";
		
//		ConversationService service = new ConversationService(ConversationService.VERSION_DATE_2017_02_03,"58ba03ca-2d74-4fa6-9f4d-79a445b0959a", "ZGMohC8JTMOG"); <== Anthony>
		ConversationService service = new ConversationService(ConversationService.VERSION_DATE_2017_04_21,"e0d68b4a-3700-42b4-9f27-f13c1f823ecd", "EmkLIm2zk5Ge");
		MessageRequest newMessage = new MessageRequest.Builder().inputText(input).context(context).build();
		// Workspace ID of Conversation current workspace
//		String workspaceId = "d3ec4757-c9bc-4568-89cd-126bb4b9e435"; <== Migrado
		String workspaceId = "0f3c8ba8-a6f8-4cc0-9228-911ea1df420e";
		MessageResponse response = service.message(workspaceId, newMessage).execute();
//		System.out.println(response);
		return response;
	}
}
