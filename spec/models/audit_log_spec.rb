require 'rails_helper'

RSpec.describe AuditLog, type: :model do
    describe 'creation' do 
        it 'can be created' do 
            @audit_log = FactoryBot.create(:audit_log)
            expect(@audit_log).to be_valid
        end
    end
end
