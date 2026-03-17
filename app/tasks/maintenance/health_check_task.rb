module Maintenance
  class HealthCheckTask < MaintenanceTasks::Task
    def collection
      [1]
    end

    def process(_element)
      Rails.logger.info("Maintenance health check: OK")
    end
  end
end
