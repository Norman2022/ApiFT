package api.config;

import services.*;

public enum EntityConfiguration {


    TIMEENTRY {
        @Override
        public Class<?> getEntityService() {
            return TimeEntryService.class;
        }
    };
    public abstract Class<?> getEntityService();
}
