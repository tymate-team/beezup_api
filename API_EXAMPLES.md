test = Hashie::Mash.new({
  "result": {
    "paginationResult": {
      "currentNumberOfEntries": 25,
      "links": [
        {
          "rel": "first",
          "hRef": "/orders/v1/00000000-0000-0000-0000-000000000000?beginPeriodUtcDate=2014-08-25T07:32:31.584Z&endPeriodUtcDate=2014-09-24T07:32:31.584Z&entriesPerPage=25&pageNumber=1&dateSearchType=Modification",
          "method": "GET"
        },
        {
          "rel": "last",
          "hRef": "/orders/v1/00000000-0000-0000-0000-000000000000?beginPeriodUtcDate=2014-08-25T07:32:31.584Z&endPeriodUtcDate=2014-09-24T07:32:31.584Z&entriesPerPage=25&pageNumber=38&dateSearchType=Modification",
          "method": "GET"
        },
        {
          "rel": "next",
          "hRef": "/orders/v1/00000000-0000-0000-0000-000000000000?beginPeriodUtcDate=2014-08-25T07:32:31.584Z&endPeriodUtcDate=2014-09-24T07:32:31.584Z&entriesPerPage=25&pageNumber=2&dateSearchType=Modification",
          "method": "GET"
        }
      ],
      "totalNumberOfPages": 38,
      "totalNumberOfEntries": 943
    },
    "orderHeaders": [
      {
        "marketPlaceBusinessCode": "CDISCOUNT",
        "marketPlaceOrderId": "1409240634H9Y3O",
        "beezUPOrderState": "InProgress",
        "marketPlaceOrderState": "AcceptedBySeller",
        "purchaseUtcDate": "2014-09-24T04:34:59.167Z",
        "buyerFullName": "James Brown",
        "lastModificationUtcDate": "2014-09-24T07:16:43.973Z",
        "totalAmount": 25,
        "isoCurrencyCode": "EUR",
        "orderMetaInfos": "null",
        "merchantOrderId": "",
        "links": [
          {
            "rel": "self",
            "hRef": "/orders/v1/00000000-0000-0000-0000-000000000000/CDiscount/1111/0000000000000000000000000000000000000000000000e",
            "method": "GET"
          }
        ],
        "marketPlaceTechnicalCode": "CDiscount",
        "accountId": 1111,
        "beezUPOrderUUID": "0000000000000000000000000000000000000000000000e"
      },
      {
        "marketPlaceOrderId": "171-2510593-4442714",
        "beezUPOrderState": "Shipped",
        "marketPlaceOrderState": "Shipped",
        "purchaseUtcDate": "2014-09-23T08:37:27Z",
        "buyerFullName": "George ABITBOL",
        "lastModificationUtcDate": "2014-09-23T14:26:43Z",
        "totalAmount": 22,
        "isoCurrencyCode": "EUR",
        "orderMetaInfos": "null",
        "merchantOrderId": "",
        "links": [
          {
            "rel": "self",
            "hRef": "/orders/v1/00000000-0000-0000-0000-000000000000/Amazon/901/a1111111111111111111111111111111111111532e4691",
            "method": "GET"
          }
        ],
        "marketPlaceTechnicalCode": "Amazon",
        "accountId": 901,
        "beezUPOrderUUID": "a1111111111111111111111111111111111111532e4691"
      }
    ]
  },
  "request": {
    "userId": "00000000-0000-0000-0000-000000000000",
    "storeIds": "null",
    "marketPlaceTechnicalCodes": "null",
    "beginPeriodUtcDate": "2014-08-25T07:32:31.5840209Z",
    "endPeriodUtcDate": "2014-09-24T07:32:31.5840209Z",
    "beezUPOrderStates": "null",
    "entriesPerPage": 25,
    "pageNumber": 1,
    "accountIds": "null",
    "dateSearchType": "Modification",
    "marketPlaceOrderIds": "null",
    "buyerFullName": "null"
  },
  "info": "null"
})
