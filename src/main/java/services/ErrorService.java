package services;

import api.model.Project.ErrorResponse;
import com.crowdar.api.rest.MethodsService;
import com.crowdar.api.rest.Response;

public class ErrorService extends MethodsService {

    public static Response get(String jsonName) {
        return get(jsonName, ErrorResponse.class);
    }

  /*  private static Map<String, String> setParams() {
        Map<String, String> params = new HashMap<String, String>();
        params.put("base.url", PropertyManager.getProperty("base.api.url"));
        params.put("api-key",API_KEY.get());
        return params;
    }*/

}
