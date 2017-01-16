# frozen_string_literal: true
module AuditTables
  class CreateAuditTablesForExistingTables
    attr_reader :klasses

    def initialize
      @klasses = ActiveRecord::Base.connection.tables
      @klasses -= Module::BLACK_LISTED_TABLES
    end

    def process
      klasses.each do |klass|
        AuditTables::BuildAuditTrigger.new(klass).build
        AuditTables::CreateNewAuditTable.new(klass).build
      end
    end
  end
end
