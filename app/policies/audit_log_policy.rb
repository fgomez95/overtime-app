class AuditLogPolicy < ApplicationPolicy
    def index?
        return true if admin?
    end
    
    def confirm?
        return true if user.id == record.user_id
    end
    
    private
    
    def admin?
        admin_types.include?(user.type)
    end
end