require 'rails_helper'

RSpec.describe AuditLog, type: :model do
    before do 
        @audit_log = FactoryBot.create(:audit_log)
    end
    describe 'creation' do 
        it 'can be created' do 
            expect(@audit_log).to be_valid
        end
    end
    
    describe 'validations' do
        
        it 'validates presence of status' do 
            @audit_log.update(status: nil)
            expect(@audit_log).to be_invalid
        end
        
        it 'validates presence of start_date' do 
            @audit_log.update(start_date: nil)
            expect(@audit_log).to be_invalid
        end
        
        it 'should have a 6 day prior default value' do 
            log = User.last.audit_logs.create!()
            expect(log.start_date).to eq(Date.today - 6.days)
        end
    end
end
