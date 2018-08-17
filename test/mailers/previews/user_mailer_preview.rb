
class UserMailerPreview < ActionMailer::Preview
    def order_receipt_email
        UserMailer.order_receipt_email(Order.last.email, Order.last)
    end
  end