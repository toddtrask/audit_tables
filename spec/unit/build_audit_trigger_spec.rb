# frozen_string_literal: true
require_relative '../../lib/audit_tables'

describe AuditTables::BuildAuditTrigger do
  it 'can be' do
    expect(described_class.new({})).to be_an_instance_of(AuditTables::BuildAuditTrigger)
  end
end
