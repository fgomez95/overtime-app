class Post < ApplicationRecord
    belongs_to :user
    validates_presence_of :date, :rationale, :overtime_request
    validates :overtime_request, numericality: { greater_than: 0.0 }
    enum status: {
        submitted: 0,
        approved: 1,
        rejected: 2,
    }
    scope :user_posts, -> (user){where(user_id: user.id)}
    after_save :update_audit_log
    
    private
    
    def update_audit_log
        audit_log = AuditLog.where(user_id: self.user_id, 
        start_date: (self.date - 7.days..self.date)).last
        audit_log.confirmed!
    end
end
