package topic.member;

public class TopicFactory {
	public static TopicDao createTopicDao(){
		TopicDao dao = new TopicImpl();
		return dao ;
	}
}
