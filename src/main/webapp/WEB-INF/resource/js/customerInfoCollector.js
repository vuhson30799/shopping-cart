function cancelCollectCustomerInfo(cartId) {
    const url = '/order/cancel/' + cartId + ''
    $.ajax({
        type:"get",
        contentType: 'application/json',
        url: url,
        success: function () {
            $(location)[0].href = 'http://localhost:8080/cart/getCartById/'
    },
        error: function () {
            $(location)[0].href = 'http://localhost:8080/home?errorMessage=' + 'Technical Error'
        }
    })
}

function orderConfirmation(cartId) {
    const address = document.getElementById('cart.customer.shippingAddress.address').value
    const city = document.getElementById('cart.customer.shippingAddress.city').value
    const state = document.getElementById('cart.customer.shippingAddress.state').value
    const country = document.getElementById('cart.customer.shippingAddress.country').value
    const zipcode = document.getElementById('cart.customer.shippingAddress.zipcode').value
    const customerOrderId = document.getElementById('customerOrderId').value
    const data = {
        customerOrderId,
        shippingAddressDTO: {
            address,
            city,
            state,
            country,
            zipcode
        }
    }
    $.ajax({
        type: 'POST',
        url: '/order/collectCustomerInfo',
        contentType: 'application/json',
        data: JSON.stringify(data),
        error: function () {
            $(location)[0].href = 'http://localhost:8080/home?errorMessage=' + 'Technical Error'
        },
        success: function () {
            $(location)[0].href = 'http://localhost:8080/order/confirm/' + cartId
        }
    })

}

function backToCollectCustomerInfo(cartId) {
    $(location)[0].href = 'http://localhost:8080/checkout?cartId=' + cartId
}

function submitOrder(customerOrderId) {
    $.ajax({
        type: 'POST',
        url: '/order/submit/' + customerOrderId,
        success: function () {
            $(location)[0].href = 'http://localhost:8080/order/thanks'
        },
        error: function () {
            $(location)[0].href = 'http://localhost:8080/home?errorMessage=' + 'Technical Error'
        }
    })
}
