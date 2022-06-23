package services;

import api.model.Project.TimeEntryResponse;
import com.crowdar.api.rest.MethodsService;
import com.crowdar.api.rest.Response;

import java.util.Map;

public class TimeEntryService extends MethodsService{


    public static Response post(String jsonName, Map<String, String> params) {
        return post(jsonName, TimeEntryResponse.class,params);
}
    public static Response put(String jsonName, Map<String, String> params) {
        return put(jsonName, TimeEntryResponse.class,params);
    }
    public static Response delete(String jsonName, Map<String, String> params) {
        return delete(jsonName, TimeEntryResponse.class,params);
    }
        public static Response get(String jsonName) {
            return get(jsonName, TimeEntryResponse[].class);
        }

        public static Response put(String jsonName) {
            return put(jsonName, TimeEntryResponse.class);
        }

        public static Response post(String jsonName) {
        return post(jsonName, TimeEntryResponse.class);
    }

        public static Response delete(String jsonName) {
        return delete(jsonName, TimeEntryResponse.class);
    }


    }

