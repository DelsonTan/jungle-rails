class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'

    def order_receipt_email(user, order)
        @user = user
        @order = order
        mail(to: @user, subject: @order.id)
    end
end
