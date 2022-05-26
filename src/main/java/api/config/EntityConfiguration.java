package api.config;

import services.*;

public enum EntityConfiguration {

    USER {
        @Override
        public Class<?> getEntityService() {
            return UserService.class;
        }

    },
    RESPONSE_HEADERS {
        @Override
        public Class<?> getEntityService() {
            return ResponseHeadersService.class;
        }
    },
    WORKSPACE {
        @Override
        public Class<?> getEntityService() {
            return WorkspaceService.class;
        }
    },
    PROJECT {
        @Override
        public Class<?> getEntityService() {
            return ProjectService.class;
        }
    },
    PROJECTBYID {
        @Override
        public Class<?> getEntityService() {
            return ProjectServiceById.class;
        }
    },
    PROJECT_PARAM {
        @Override
        public Class<?> getEntityService() {
            return ProjectServiceParam.class;
        }
    },
    ERROR {
        @Override
        public Class<?> getEntityService() {
            return ErrorService.class;
        }
    };

    public abstract Class<?> getEntityService();
}
