class PostPolicy < ApplicationPolicy
    def update?
        return true if admin? || (owner? && !record.approved?)
    end
    
    def show?
        owner? || admin?
    end
    
    private
    
    def admin?
        admin_types.include?(user.type)
    end
    
    def owner?
        record.user_id == user.id
    end
end