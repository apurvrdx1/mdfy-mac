[Embedded media omitted from source PDF]

## A guide to payment methods

## Introduction

As online tools make it easier to connect with global customers, more and more businesses are selling overseas. In fact, a Stripe study found that 70% of online businesses are selling internationally today. While it's easier than ever to reach a global audience, online businesses are also faced with a new challenge: How do you address the diverse customer preferences of a global audience during the checkout experience? The way customers prefer to pay for goods or services online varies drastically based on where they are located. If you don't create a relevant, familiar payment experience, you could cut off entire countries from your addressable market.

While the global payments landscape has become increasingly complex and fragmented, Stripe makes it easy for any type of business anywhere in the world to discover and accept popular payment methods with a single integration.

This guide helps you evaluate and identify the payment methods that are well-suited to your business model and customer preferences and offers an in-depth look at the payment methods Stripe supports.

[Embedded media omitted from source PDF]

## The benefits of payment methods

Over the past decade, payment methods have evolved to support different consumer and business needs. Markets with high card penetration, such as the US and the UK, have seen a significant shift towards digital wallets like Apple Pay and Google Pay, which offer more security and convenience. Some markets, such as France and Japan, even have their own local card networks that help businesses reach more card users. In markets like Germany and Malaysia, where card use is much lower, bank-based methods are strongly preferred and trusted for online purchases. The banking networks in these markets typically offer a faster and more secure checkout experience where users can authorize a payment using their online banking credentials. Meanwhile, in economies with a large unbanked population, such as Mexico and Indonesia, popular payment methods allow customers to pay for online goods with cash using vouchers. Cards, Digital Wallets, Bank Debits and Transfers, Cash-Based, Other

These graphs show how payment method preferences vary across countries

[Embedded media omitted from source PDF]

By accepting payment methods that are both preferred by your customers and relevant for your business model, you can:

- Reach more customers globally: As you expand into new regions, accepting local payment methods may be necessary to capture the total market opportunity. For example, 54% of online transactions in China involve digital wallets such as Alipay or WeChat Pay, and 20% with the local card network China Union Pay. Without supporting these payment methods, you may risk missing out on the substantial and growing buying power of Chinese consumers.
- Increase conversion: Up to 16% of shoppers abandon their cart if their preferred payment option isn't available. Surfacing the right mix of payment options to customers can meaningfully increase the chances that they'll successfully complete a purchase.
- Reduce fraud and disputes: Anticipate and manage the risks associated with accepting online payments by choosing payment methods that match your risk preferences. As a general rule, the better the level of customer authentication, the lower the likelihood of fraudulent and disputed payments.
- Optimize your transaction costs: Payment methods have inherently different cost structures. Depending on your business model, where your customers are located, and your average transaction value, you may be able to reduce your fees by accepting lower-cost payment methods like bank debits.

## Choosing the right payment methods for your business

Whether you want to improve conversion in your domestic market or expand globally, surfacing relevant payment methods to your customers is key. Depending on your business model and where your customers are located, certain payment methods may or may not be relevant.

This section covers the seven major payment method families and specific considerations based on your business model: e-commerce and marketplaces, on-demand services, SaaS and subscription businesses, or professional services. If you are a B2B platform that enables your users to accept payments, your relevant payment methods depend on the business model of your users (for example, if your users have a SaaS business model, refer to the 'SaaS and subscription businesses' section).

|                            | DESCRIPTION                                                                                                                                                                                                                                       | SUPPORTS RECURRING PAYMENTS                                                      | SUPPORTS REFUNDS   | SUPPORTS DISPUTES                         | PAYMENT CONFIRMATION   |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|--------------------|-------------------------------------------|------------------------|
| Cards                      | Cards are linked to a debit or credit account at a bank.To complete a payment online, customers enter their card information at checkout.                                                                                                         | Yes                                                                              | Yes                | Yes , highest dispute rate                | Immediate              |
| Digital wallets            | Digital wallets are linked to a card or bank account, but can also store monetary value. Digital wallets typically require customer verification (e.g., biometrics, SMS, passcode) to complete a payment.                                         | Yes                                                                              | Yes                | Yes , lower dispute rate than cards       | Immediate              |
| Bank debits                | Bank debits pull funds directly from your customer's bank account. Customers provide their bank account information and typically agree to a mandate for you to debit their account.                                                              | Yes                                                                              | Yes                | Yes , lowest dispute rate                 | Delayed                |
| Authenticated bank debits  | Authenticated bank debit methods add a layer of verification to complete a bank debit payment. Instead of entering their bank account information, customers are redirected to provide their online banking credentials to authorize the payment. | No, but Stripe supports recurring for some methods by converting to direct debit | Yes                | No                                        | Immediate              |
| Bank credit transfers      | Credit transfers allow customers to push funds from their bank account to yours.You provide customers with the bank account information they should send funds to.                                                                                | No                                                                               | Yes                | No                                        | Delayed                |
| Buy now, pay later         | Buy now, pay later is a growing category of payment methods that offers customers immediate financing for online payments, typically repaid in fixed installments over time.                                                                      | No                                                                               | Yes                | Yes ,most methods will take on fraud risk | Delayed                |
| Cash-based payment methods | With cash-based payment methods, customers receive a scannable voucher with a transaction reference number that they can then bring to an ATM, bank, convenience store, or supermarket to complete the payment in cash.                           | No                                                                               | No                 | No                                        | Delayed                |

## For e-commerce and marketplaces

Recommended: Cards, digital wallets, authenticated bank debits, 'buy now, pay later'

While frictionless checkout experiences are vital for any business model, its importance is magnified for e-commerce and marketplaces. Customers expect streamlined payment experiences-ones that give them what they want, when they want it. The right set of payment methods not only offers payment flexibility and convenience to maximize conversion, but also reduces fraud and increases transaction speed.

Cards are the most commonly used payment method and it's important that you support all relevant card brands to optimize conversion and costs. Digital wallets and authenticated bank debits can also help increase conversion by allowing customers to use stored payment information (the added verification also lowers the possibility of disputes). Digital wallets, like cards, are a reusable payment method-customers provide their payment details once and if that information is stored, they don't need to share any additional information for future payments. This enables you to offer one-click checkout experiences. If you sell high-value goods, consider 'buy now, pay later' payment options, which allow your customers to customize their payment terms and break up purchases into smaller installments.

In many large markets with low card use, such as Brazil, Mexico, and Indonesia, customers prefer to pay with cash-based payment methods and bank credit transfers, which don't support immediate payment confirmation or native refunds. This can create challenges for e-commerce businesses that typically rely on real-time payment notifications to manage their shipping flows or refunds to promote customer loyalty. Stripe can help global businesses cater to these customers by enabling automated refund experiences and faster notifications for payment types that don't typically support these features.

## For on-demand services

## Recommended: Cards, digital wallets

With instant fulfillment at the heart of the customer experience, on-demand services need to encourage conversion-often on mobile-while managing fraud risk. Consider focusing on payment methods that offer immediate confirmation that the transaction was successful, such as cards and digital wallets. These payment options also allow you to store customer payment details on file and enable one-tap confirmations, shortening the checkout experience. While digital wallets typically have the same transaction cost as cards, they are more secure since authentication is required to complete payment, lowering fraud and dispute rates.

It's still important to consider the local context as payment methods with more friction may be trusted and preferred to pay for on-demand services or add top-ups to customers' app balance.

## For SaaS and subscription businesses

## Recommended: Cards, digital wallets, bank debits

If you manage recurring revenue and want to optimize your checkout experience for ongoing transactions, it's important to consider whether or not payment details can be stored on file and reused. The ability to reuse a customer's payment credentials allows you to initiate payments on a custom schedule, without requiring any action by your customers. Cards, digital wallet, and bank debit payments are all reusable-customers only need to provide their card number or bank account details once. And, for customers who prefer to use authenticated bank debits such as iDEAL, SOFORT, or Bancontact, Stripe makes it possible to use these methods for recurring payments by converting them into direct debits.

In addition, many SaaS and subscription companies face involuntary churn issues, where customers intend to pay for a product but their payment attempt fails due to expired cards, insufficient funds, or incorrect card details. In fact, 9% of subscription invoices fail on the first charge attempt due to involuntary churn. Stripe Billing can help manage recurring declines for cards, in addition to supporting many of the most relevant payment methods for increasing recurring payment conversion (for example, because bank account information doesn't expire, accepting bank debits can increase retention).

While accepting reusable payment methods is beneficial to the business, it's also important to consider local expectations regarding recurring billing. For example, in markets like Brazil and Indonesia, it's common to send recurring invoices or reminders for customers to initiate each payment. Stripe Billing makes it easy to accommodate both recurring charges and invoicing.

## For professional services

Recommended: Cards, bank debits, bank credit transfers

If you offer professional services or wholesale products, even a single payment failure or dispute could result in significant revenue loss. The ability to securely and successfully accept large payments can protect your business and can be solved, in part, by invoicing your customers so they have more flexibility to initiate payment when funds are available. Historically this has often meant asking customers to send checks. You can also send a hosted invoice with built-in support for cards and bank methods to minimize payment failure and automate payment tracking and reconciliation.

In addition, bank credit transfers are a secure, non-disputable payment option that is often preferred for very large payments. Credit transfer funds are deposited directly into your account once the payment has been confirmed. Credit transfers also require your customers to initiate the payment, adding an extra level of authentication and security.  And, because contracts are typically in place before payment, it's less important that your business initiates the payment and

more important that payments don't fail and can't be disputed. While tracking and reconciliation for credit transfers can be difficult, Stripe generates virtual bank account numbers to keep your company's banking details private and automatically reconcile incoming payments with outstanding invoices.

This table summarizes relevant payment methods supported on Stripe by business model

[Embedded media omitted from source PDF]

|                                             | ECOMMERCE AND MARKETPLACES                                                                          | ON-DEMAND SERVICES                                                                                   | SAAS AND SUBSCRIPTION                                                                                | PROFESSIONAL SERVICES                                |
|---------------------------------------------|------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|------------------------------------------------------|
| Global customers                            | American Express Discover and Diners Mastercard Visa Click to Pay Apple Pay Google Pay Microsoft Pay | American Express Discover and Diners Mastercard Visa Click to Pay Apple Pay Google Pay Microsoft Pay | American Express Discover and Diners Mastercard Visa Click to Pay Apple Pay Google Pay Microsoft Pay | American Express Discover and Diners Mastercard Visa |
| Asia Pacific customers                      | China UnionPay JCB Alipay WeChat Pay FPX                                                             | China UnionPay JCB Alipay WeChat Pay                                                                 | China UnionPay JCB BECS Direct Debit                                                                 | China UnionPay JCB BECS Direct Debit                 |
| European customers                          | Cartes Bancaires Bancontact EPS giropay iDEAL Multibanco Przelewy24 SOFORT                           | Cartes Bancaires                                                                                     | Cartes Bancaires Bacs Direct Debit SEPA Direct Debit Bancontact iDEAL SOFORT                         | Cartes Bancaires Bacs Direct Debit SEPA Direct Debit |
| North American and Latin American customers | Interac Klarna OXXO                                                                                  |                                                                                                      | ACH Debit Pre-Authorized Debits                                                                      | ACH Debit ACH Credit Transfer Pre-Authorized Debits  |

## How Stripe can help

Companies of all sizes and from around the world use Stripe to accept multiple payment methods and simplify global operations. Stripe is actively adding new payment methods with the goal of enabling businesses to accept any payment method in the world with a single integration.

## Stripe offers:

Seamless integration options for all business models: The entire Stripe product suite comes with built-in global payment support, so you can create localized payment experiences regardless of your business model. Stripe's Payments API makes it easy to support multiple payment methods through a single integration. This leaves you with a unified and elegant integration that involves minimal development time and remains easy to maintain, regardless of which payment methods you choose to implement.

Supporting a localized and compliant payments experience for global customers is even easier with Stripe Checkout, our drop-in payments flow. With Stripe Checkout, you can add payment methods by changing a single line of code and rely on Stripe to dynamically display the right payment methods and language based on IP, browser locale, cookies, and other signals. Checkout is also able to trigger 3D Secure and can handle European SCA requirements by dynamically applying card authentication when required by the cardholder's bank.

Recurring revenue businesses can use Stripe Billing to manage subscription logic and invoices, and give customers the ability to pay their invoices with bank debits or other preferred payment methods. Platforms and marketplaces can use Stripe Connect to accept money and pay out to third parties. Your sellers or service providers benefit from the same streamlined Stripe onboarding and get instant access to select payment methods.

Simple payment method setup: Stripe allows you to quickly add and scale global payment method support without filling out multiple forms with the same information or following one-off onboarding processes. You can also enable certain international payment methods without having to set up a local entity, bank account, or Stripe account.

Expanded payment method capabilities: Stripe can fill in certain gaps in payment method capabilities and expand their supported use cases. For example, authenticated bank debits such as iDEAL, SOFORT, or Bancontact don't normally support recurring payments. However, Stripe converts these payment methods into direct debits so customers can use them to pay for subscription services.

Unified monitoring and reporting: Payments made with any payment method appear in the Stripe Dashboard, reducing operational complexity and allowing for lightweight financial reconciliation. This enables you to develop standardized processes for typical operations such as fulfillment, customer support, and refunds. And, because Stripe abstracts away the complexity of dealing with each payment method provider, you also benefit from one single point of escalation

and accountability on disputes or other exceptions that may arise when dealing with diverse payment methods.

For more information on supporting payment methods with Stripe, read our docs or contact our sales team. To start accepting payments right away, sign up for an account.

## Payment methods fact sheets

Based on your customer's geography and your business model, identify relevant payment methods to integrate by reviewing the profiles of Stripe-supported payment options below. You can also see which payment methods are available for your account by visiting the Dashboard.

| ACH credit transfers            |   10 |
|---------------------------------|------|
| ACH debits                      |   11 |
| Alipay                          |   12 |
| Apple Pay                       |   13 |
| Bacs direct debit               |   14 |
| Bancontact                      |   15 |
| BECS direct debit               |   16 |
| Cards                           |   17 |
| Click to Pay                    |   18 |
| EPS                             |   19 |
| FPX                             |   20 |
| Giropay                         |   21 |
| Google Pay                      |   22 |
| iDEAL                           |   23 |
| Klarna                          |   24 |
| Microsoft Pay                   |   26 |
| Multibanco                      |   27 |
| OXXO                            |   28 |
| Pre-authorized debits in Canada |   29 |
| Przelewy24                      |   30 |
| SEPA direct debit               |   31 |
| SOFORT                          |   32 |
| WeChatPay                       |   33 |

## ACH credit transfers

Credit transfers on the Automated Clearing House (ACH) network enable customers to send funds from their bank account to a US-domiciled bank account. In 2019, the ACH network moved 24.7 billion electronic payments, making it one of the largest, safest, and most reliable payment systems.

To collect a payment via ACH credit transfer, you must provide a routing and account number to your customers, who then initiate the payment from their bank account. Funds can take a few days to arrive, however some financial institutions process sameday ACH credit transfers, allowing for accelerated movement of funds.

Start accepting ACH credit transfers →

## PAYMENT METHOD TYPE

Bank credit transfer

## RELEVANT CUSTOMER GEOGRAPHY

US

## RELEVANT BUSINESS MODEL

Professional services

## PRESENTMENT CURRENCY

USD

## RECURRING PAYMENTS

No

## REFUNDS

Yes

## DISPUTES

No

## PAYMENT CONFIRMATION

2-3 business days

[Embedded media omitted from source PDF]

## ACH debits

Direct debit payments on the Automated Clearing House (ACH) network, or ACH debits, allow you to collect funds from your customers' US bank accounts. The ACH network processed more than 14 billion debit transactions in 2019.

Your customers must provide their bank account details and give you permission to debit their account. Confirmation for ACH debit payments can take up to five business days.

ACH debits can fail or can be disputed by customers after the payment is initially completed. These risks can be mitigated by verifying account ownership through login credentials or micro-deposits.

Start accepting ACH debits →

## PAYMENT METHOD TYPE

Bank debit

## RELEVANT CUSTOMER GEOGRAPHY

US

## RELEVANT BUSINESS MODEL

SaaS and subscription businesses, professional services

## PRESENTMENT CURRENCY

USD

## RECURRING PAYMENTS

Yes

## REFUNDS

Yes

## DISPUTES

Yes

## PAYMENT CONFIRMATION

5 business days

[Embedded media omitted from source PDF]

## Alipay

Alipay is a popular digital wallet in China, operated by Ant Financial Services Group, a financial services provider affiliated with Alibaba. Launched in 2004, Alipay currently has more than one billion active users worldwide.

Alipay wallet holders can pay on the web or on mobile using their login credentials or their Alipay app. Funds are drawn from the customer's bank, card, or prepaid Alipay account and because payments are authenticated with the customer's login credentials, dispute rates are very low.

Start accepting Alipay →

## PAYMENT METHOD TYPE

Digital wallet

## RELEVANT CUSTOMER GEOGRAPHY

All geographies with Chinese consumers

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces, on-demand services

## PRESENTMENT CURRENCY

AUD, CAD, CNY, EUR, GBP, HKD, JPY, MYR, NZD, USD

## RECURRING PAYMENTS

Supported through Stripe if approved

## REFUNDS

Yes

## DISPUTES

No

## PAYMENT CONFIRMATION

Immediate

[Embedded media omitted from source PDF]

## Apple Pay

Apple Pay is a digital wallet that allows customers to pay using payment details stored on their iPhone, iPad, or Apple Watch. To make a payment online, customers select Apple Pay as the payment method and authorize the transaction via Face ID, Touch ID, or a passcode. This two-factor authentication makes transactions more secure and often results in fewer disputes compared to other payment methods.

In addition to payment information, customers can also store their billing and shipping address, email, and phone number.

Start accepting Apple Pay →

## PAYMENT METHOD TYPE

Digital wallet

## RELEVANT CUSTOMER GEOGRAPHY

Where Apple Pay is supported

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces, on-demand services, SaaS and subscription businesses

## PRESENTMENT CURRENCY

135+

## RECURRING PAYMENTS

Yes

## REFUNDS

Yes

## DISPUTES

Yes

## PAYMENT CONFIRMATION

Immediate

[Embedded media omitted from source PDF]

## Bacs Direct Debit

Bacs Direct Debits is a bank transfer payment method that accounts for 14% of the market share in the United Kingdom. It is also the most popular method for sending and receiving recurring payments.

You are required to get explicit approval from customers in order to debit their account. Customers may cancel this approval at any time with their bank and can reclaim payments indefinitely via Bacs' evergreen dispute policy.

Payments via Bacs' Direct Debit take three working days to clear and are always presented in GBP. Funds can only be taken from UK domiciled GBP bank accounts.

Start accepting Bacs Direct Debit →

[Embedded media omitted from source PDF]

## PAYMENT METHOD TYPE

Bank debit

## RELEVANT CUSTOMER GEOGRAPHY

UK

## RELEVANT BUSINESS MODEL

SaaS and subscription services, professional services

## PRESENTMENT CURRENCY

GBP

## RECURRING PAYMENTS

Yes

## REFUNDS

Yes

## DISPUTES

Yes

## PAYMENT CONFIRMATION

3 business days

## Bancontact

Bancontact, founded in 1979 and formerly known as Bancontact/Mister Cash, is an authenticated bank debit payment method offered by more than 80% of online businesses in Belgium.

Bancontact payments are authenticated by customers and immediately confirmed to your business. Using their mobile app, customers can identify by scanning a QR code presented at the time of payment. Each transaction is then confirmed with a PIN.

Bancontact payment details are single-use, however each transaction allows you to retrieve customers' bank account details, enabling subsequent payments to be completed via SEPA Direct Debit with the appropriate mandate authorization.

Start accepting Bancontact →

## CUSTOMERFACING FLOW

Gets redirected to Bancontact and enters credentials

[Embedded media omitted from source PDF]

Selects Bancontact at checkout

## PAYMENT METHOD TYPE

Authenticated bank debit

## RELEVANT CUSTOMER GEOGRAPHY

Belgium

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces, SaaS and subscription businesses

## PRESENTMENT CURRENCY

EUR

## RECURRING PAYMENTS

Supported through Stripe via SEPA Direct Debit

## REFUNDS

Yes

## DISPUTES

No

## PAYMENT CONFIRMATION

Immediate

Gets notification that payment is complete

(Optional) Returns back to business's site for payment confirmation

## BECS Direct Debit

Bulk Electronic Clearing System (BECS) is an Australia-based payment method administered by the Australian Payments Network for electronic debit and credit payment instructions. It accounted for 19% of non-cash transaction value in Australia in 2018.

During the payment flow, you must collect a mandate: Customers need to provide their bank account details-consisting of the account holder's name, the Bank-State-Branch (BSB) number, and the bank account number-and accept the service agreement.

It can take up to four business days to receive notification of the success or failure of a payment after you initiate a debit from the customer's account.

Start accepting BECS Direct Debit →

[Embedded media omitted from source PDF]

## PAYMENT METHOD TYPE

Bank Debit

## RELEVANT CUSTOMER GEOGRAPHY

AU

## RELEVANT BUSINESS MODEL

SaaS and subscription businesses, professional services

## PRESENTMENT CURRENCY

AUD

## RECURRING PAYMENTS

Yes

## REFUNDS

Yes

## DISPUTES

Yes

## PAYMENT CONFIRMATION

3-4 business days

## Cards

Credit and debit cards (Visa, Mastercard, American Express, Discover and Diners, China UnionPay, JCB, Cartes Bancaires, Interac) are a dominant payment method globally, accounting for 41% of online payments.

Credit cards are issued by banks and allow customers to borrow money with a promise to pay it back within a grace period to avoid extra fees. Consumers can accrue a continuing balance of debt, subject to being charged interest on the amount.

Debit cards offer the convenience of card payments but are linked to a bank account, where funds are drawn directly from the linked account at the time of payment.

Visa and Mastercard, the largest card networks in the world, function exclusively as payment processing systems that do not issue cards to consumers directly. Instead, they allow banks and financial institutions to brand and distribute their cards. American Express is also a payment processing system that-unlike Visa and Mastercard-issues its own cards directly to consumers.

Start accepting cards →

[Embedded media omitted from source PDF]

| PAYMENT METHOD TYPE                                                                                      |
|----------------------------------------------------------------------------------------------------------|
| Card                                                                                                     |
| RELEVANT CUSTOMER GEOGRAPHY                                                                              |
| Global                                                                                                   |
| RELEVANT BUSINESS MODEL                                                                                  |
| E-commerce and marketplaces, SaaS and subscription businesses, on-demand services, professional services |
| PRESENTMENT CURRENCY 135+                                                                                |
| RECURRING PAYMENTS Yes                                                                                   |
| REFUNDS                                                                                                  |
| Yes                                                                                                      |
| PAYMENT                                                                                                  |
| CONFIRMATION Immediate                                                                                   |

## Click to Pay

Click to Pay, based on the Secure Remote Commerce (SRC) specifications, provides a unified checkout process supporting all participating network brands, including Visa, Mastercard, American Express, and Discover. Customers can add cards from participating networks and enable click-to-pay simply and securely.

To complete a transaction, customers select the Click to Pay checkout option. In some instances, they may be required to confirm their identity. Once they are authenticated, the payment cards enrolled in Click to Pay will appear as payment method options, customers select which card they wish to use, and confirm payment and shipping information.

Start accepting Click to Pay →

## PAYMENT METHOD TYPE

Digital wallet

## RELEVANT CUSTOMER GEOGRAPHY

Global

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces, on-demand services, SaaS and subscription businesses

## PRESENTMENT CURRENCY

135+

## RECURRING PAYMENTS

Yes

## REFUNDS

Yes

## DISPUTES

Yes

## PAYMENT CONFIRMATION

Immediate

[Embedded media omitted from source PDF]

## EPS

EPS is an Austrian online transfer payment method with  approximately 18% market share. It's accepted by 80% of all online businesses in Austria and was developed jointly by the Austrian banks and government.

At checkout, customers choose EPS, select the name of their bank, and log into their online banking environment. They review the pre-populated payment details and authorize the funds to be credited directly to your business account.

Start accepting EPS →

## PAYMENT METHOD TYPE

Authenticated bank debit

## RELEVANT CUSTOMER GEOGRAPHY

Austria

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces

## PRESENTMENT CURRENCY

EUR

## RECURRING PAYMENTS

No

REFUNDS

Yes

## DISPUTES

No

## PAYMENT CONFIRMATION

Immediate

[Embedded media omitted from source PDF]

## FPX

Financial Process Exchange (FPX) is a Malaysia-based payment method that allows customers to complete transactions online using their bank credentials. Bank Negara Malaysia (BNM), the Central Bank of Malaysia, and eleven other major Malaysian financial institutions are members of the PayNet Group, which owns and operates FPX. It is one of the most popular online payment methods in Malaysia, with nearly 90 million transactions in 2018.

In order to pay with FPX, customers are redirected to their online banking environment where they have to perform two-step authorization, like entering a one-time passcode sent via SMS. The exact customer experience will vary depending on the bank.

Start accepting FPX →

| PAYMENT METHOD TYPE         |
|-----------------------------|
| Authenticated bank debit    |
| RELEVANT CUSTOMER GEOGRAPHY |
| Malaysia                    |
| RELEVANT BUSINESS MODEL     |
| E-commerce and marketplaces |
| PRESENTMENT CURRENCY MYR    |
| RECURRING PAYMENTS No       |
| REFUNDS                     |
| Yes                         |
| DISPUTES                    |
| PAYMENT CONFIRMATION        |
| Immediate                   |
| No                          |

[Embedded media omitted from source PDF]

## giropay

giropay is an online bank transfer payment method offered by more than 1,500 banks in Germany.

Customers are able to complete transactions using their online bank credentials, with funds being debited from their bank account. Depending on their bank, customers confirm payments using a second-factor authentication or a PIN. Payments are immediately confirmed to your business and irrevocable.

Because giropay uses real-time bank transfers, payments are 100% guaranteed.

Start accepting giropay →

## PAYMENT METHOD TYPE

Authenticated bank debit

## RELEVANT CUSTOMER GEOGRAPHY

Germany

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces

## PRESENTMENT CURRENCY

EUR

## RECURRING PAYMENTS

No

## REFUNDS

Yes

## DISPUTES

No

## PAYMENT CONFIRMATION

Immediate

[Embedded media omitted from source PDF]

## Google Pay

Google Pay allows customers to pay with any payment method saved to their Google account.

Google Pay works in Android native apps and across the web. To make a payment online, customers select Google Pay as the payment method and select which payment credential they would like to use. These include credit and debit cards the customer may have used on any Google property, such as Chrome, YouTube, or the Play Store. Google Pay does not allow users to hold a balance.

In addition to payment information, you can request the customer's billing and shipping address, and contact information.

Start accepting Google Pay →

## PAYMENT METHOD TYPE

Digital wallet

## RELEVANT CUSTOMER GEOGRAPHY

Where Google Pay is supported

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces, on-demand services, SaaS and subscription businesses

## PRESENTMENT CURRENCY

135+

## RECURRING PAYMENTS

No

## REFUNDS

Yes

## DISPUTES

Yes

## PAYMENT CONFIRMATION

Immediate

[Embedded media omitted from source PDF]

## iDEAL

iDEAL is a Netherlands-based payment method that allows customers to complete transactions online using their bank credentials. All major Dutch banks are members of Currence, the scheme that operates iDEAL, making it the most popular online payment method in the Netherlands with a share of online payments close to 55%.

In order to pay with iDEAL, customers are redirected to their online banking environment where they can authenticate the payment using a second factor of authentication. The exact customer experience depends on the bank. Payments are irrevocable and immediately confirmed.

While iDEAL payments are single-use, subsequent recurring payments can be completed via SEPA Direct Debit transactions.

Start accepting iDEAL →

[Embedded media omitted from source PDF]

## PAYMENT METHOD TYPE

Authenticated bank debit

## RELEVANT CUSTOMER GEOGRAPHY

The Netherlands

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces, SaaS and subscription services

## PRESENTMENT CURRENCY

EUR

## RECURRING PAYMENTS

Debit

## REFUNDS

Yes

## DISPUTES

No

## PAYMENT CONFIRMATION

Immediate

## Klarna

Klarna offers flexible payment options that give customers more freedom to choose when and how to pay for a purchase. Klarna provides payment solutions for 85 million consumers and over 200,000 businesses across 19 markets.

There are four different ways for customers to pay for a transaction with Klarna: Installments, Pay Later, Pay Now, and Financing. You can choose to offer one, two or multiple options. You are paid upfront and are protected against fraud and customer payment risk.

Klarna Installments allows customers to make an online purchase and spread the cost over four interest-free installments*.

Klarna Pay Later in 30 days* lets customers immediately complete a transaction and pay the full amount later, at no additional cost.

Pay Now, offered in select EU countries, lets a customer pay for a transaction immediately using stored payment credentials. Supported payment methods include bank transfers or direct debit.

Klarna Financing offers customers up to 36 months of credit. To receive financing, they complete a onetime application. If approved, customers make their monthly payments to Klarna online or in the mobile app.

*In the UK, customers Pay in three Installments, and Pay Later in 14 days.

Start accepting Klarna →

| PAYMENT METHOD TYPE                                                         |
|-----------------------------------------------------------------------------|
| Buy now, pay later                                                          |
| RELEVANT CUSTOMER GEOGRAPHY                                                 |
| Austria, Denmark, Finland, Germany, Norway, Sweden, The Netherlands, UK, US |
| RELEVANT BUSINESS MODEL E-commerce and marketplaces                         |
| PRESENTMENT CURRENCY EUR, GBP, USD                                          |
| RECURRING PAYMENTS No                                                       |
| REFUNDS Yes                                                                 |

## DISPUTES

Yes, for non-fraud disputes. For fraud-related disputes, Klarna takes on the risk and any associated costs.

## PAYMENT CONFIRMATION

Immediate for Pay Now. In most countries, Pay Later is also immediate. In the US and UK, a temporary credit confirmation is issued and confirmed within five business days.

[Embedded media omitted from source PDF]

## Microsoft Pay

Microsoft Pay is a digital wallet that allows customers to store their payment and shipping information so their details are auto-populated when paying from Windows devices.

Customers are prompted to sign in with their Microsoft account and authorize the payment by confirming the card's security code.

Start accepting Microsoft Pay →

## PAYMENT METHOD TYPE

Digital wallet

## RELEVANT CUSTOMER GEOGRAPHY

Where Microsoft Pay is supported

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces, on-demand services, SaaS and subscription businesses

## PRESENTMENT CURRENCY

135+

## RECURRING PAYMENTS

No

## REFUNDS

Yes

## DISPUTES

Yes

## PAYMENT CONFIRMATION

Immediate

[Embedded media omitted from source PDF]

## Multibanco

Multibanco is an interbank network that links the ATMs of all major banks in Portugal, allowing customers to pay through either their ATM or online banking environment. Multibanco has a 30% share of the payments market in Portugal.

At checkout, customers select the Multibanco payment method and then log into the Multibanco page, which displays a reference number and other transaction details. Customers use these details to initiate a payment via online banking or from an ATM.

Payments processed with Multibanco should succeed immediately, however Multibanco sources will be pending until your bank receives the funds (which can take up to a few days depending on how and when the customer chooses to complete the transaction).

Start accepting Multibanco →

[Embedded media omitted from source PDF]

## PAYMENT METHOD TYPE

Bank credit transfer

## RELEVANT CUSTOMER GEOGRAPHY

Portugal

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces

## PRESENTMENT CURRENCY

EUR

## RECURRING PAYMENTS

No

## REFUNDS

Supported through Stripe

## DISPUTES

No

## PAYMENT CONFIRMATION

Immediate

## OXXO

Pre-authorized debits (PADs) are used to collect direct debit payments from customers in Canada. In 2019, more than C$876 billion was processed through bank debits.

You are required to get explicit approval, in the form of a pre-authorized debit agreement, from customers in order to debit their accounts. The agreement must outline the debited amount, the frequency of withdrawals, and how customers can cancel the agreement (among other things).

Customers have 90 days from the date of withdrawal to report an incorrect or unauthorized debit.

## PAYMENT METHOD TYPE

Cash-based payment method

## RELEVANT CUSTOMER GEOGRAPHY

Mexico

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces

## PRESENTMENT CURRENCY

MXN

## RECURRING PAYMENTS

No

## REFUNDS

No

## DISPUTES

No

## PAYMENT CONFIRMATION

1-2 business days from when customer pays

[Embedded media omitted from source PDF]

## Pre-authorized debits in Canada

Pre-authorized debits (PADs) are used to collect direct debit payments from customers in Canada. In 2019, more than C$876 billion was processed through bank debits.

You are required to get explicit approval, in the form of a pre-authorized debit agreement, from customers in order to debit their accounts. The agreement must outline the debited amount, the frequency of withdrawals, and how customers can cancel the agreement (among other things).

Customers have 90 days from the date of withdrawal to report an incorrect or unauthorized debit.

## PAYMENT METHOD TYPE

Bank debit

## RELEVANT CUSTOMER GEOGRAPHY

Canada

## RELEVANT BUSINESS MODEL

SaaS and subscription businesses, professional services

## PRESENTMENT CURRENCY

CAD

## RECURRING PAYMENTS

Yes

## REFUNDS

Yes

## DISPUTES

Yes

## PAYMENT CONFIRMATION

2-3 business days

[Embedded media omitted from source PDF]

## Przelewy24

Przelewy24 (P24) is a Polish payment method that facilitates the transfer of funds between more than 90,000 businesses and all major Polish banks. Przelewy24 allows consumers to pay for internetbased transactions using direct online transfers from their bank account.

In order to pay with Przelewy24, customers are redirected to an online environment where they can authenticate their payment by logging into their bank's site. For the majority of banks, destination details (Przelewy24's bank account) are prepopulated, though in some cases the consumer has to enter details manually.

Upon successful authentication, funds are guaranteed. A business-initiated refund is the only way to reverse funds.

Start accepting Przelewy24 →

[Embedded media omitted from source PDF]

| PAYMENT METHOD TYPE         |           |
|-----------------------------|-----------|
| Authenticated bank debit    |           |
| RELEVANT CUSTOMER GEOGRAPHY |           |
| Poland                      |           |
| RELEVANT BUSINESS MODEL     |           |
| E-commerce and marketplaces |           |
| PRESENTMENT CURRENCY PLN    |           |
| RECURRING PAYMENTS No       |           |
| REFUNDS                     |           |
| Yes                         |           |
| No                          |           |
| DISPUTES                    |           |
| PAYMENT                     |           |
| CONFIRMATION                |           |
|                             | Immediate |

## SEPA Direct Debit

The Single Euro Payments Area (SEPA) is an initiative of the European Union to simplify payments within and across member countries. They established and enforced banking standards to allow for the direct debiting of every Euro-denominated bank account within the SEPA region, facilitating more than 20 billion transactions every year.

In order to debit an account, you must collect your customer's name and bank account number in IBAN format. As part of the payment confirmation, customers must accept a mandate that authorizes you to debit the account.

Customers are able to dispute a SEPA Direct Debit transaction within eight weeks on a 'no questions asked' basis: funds will automatically be returned to them. Beyond that point and over the following eleven months, they are still able to dispute transactions that were not backed by an appropriately authorized mandate. During that period, the arbitration process involves both your bank and the customer's bank. After 13 months, disputes are no longer possible.

Start accepting SEPA Direct Debit →

[Embedded media omitted from source PDF]

## PAYMENT METHOD TYPE

Bank debit

## RELEVANT CUSTOMER GEOGRAPHY

Austria, Belgium, Bulgaria, Croatia, Cyprus, Czech Republic, Denmark, Estonia, Finland, France, Germany, Greece, Hungary, Iceland, Ireland, Italy, Latvia, Liechtenstein, Lithuania, Luxembourg, Malta, Monaco, Netherlands, Norway, Poland, Portugal, Romania, San Marino, Slovakia, Slovenia, Spain, Sweden, Switzerland, United Kingdom

## RELEVANT BUSINESS MODEL

SaaS and subscription businesses, professional services

| PRESENTMENT CURRENCY EUR             |
|--------------------------------------|
| RECURRING PAYMENTS Yes               |
| REFUNDS Yes                          |
| DISPUTES Yes                         |
| PAYMENT CONFIRMATION 6 business days |

## SOFORT

SOFORT is a bank transfer-based payment method that was acquired by Klarna, a Swedish banking company, in 2014. It has 85 million users in 15 countries.

In order to pay with SOFORT, customers are redirected to SOFORT's site where they enter their bank login credentials. Upon authentication, SOFORT initiates a bank transfer from their bank account.

Although successful authorization indicates a very high likelihood of payment, funds are not guaranteed to your business until they are actually received, which is typically two business days later (but can be up to 14 days later). Once received, payments cannot be reversed except by business-initiated refunds.

Start accepting SOFORT →

## PAYMENT METHOD TYPE

Authenticated bank debit

## RELEVANT CUSTOMER GEOGRAPHY

Austria, Belgium, Germany, Italy, Netherlands, Spain

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces, SaaS and subscription businesses

## PRESENTMENT CURRENCY

EUR

## RECURRING PAYMENTS

Supported through Stripe via SEPA Direct Debit

## REFUNDS

Yes

## DISPUTES

No

## PAYMENT CONFIRMATION

Immediate directional confirmation; definitive confirmation delayed by typically 2 but up to 14 business days

[Embedded media omitted from source PDF]

## WeChat Pay

WeChat Pay, the digital wallet inside the popular Chinese messaging app WeChat, has more than 900 million active monthly users.

Customers must first add their credit card to their WeChat Wallet (WeChat Pay supports Visa, Mastercard, American Express, Discover, JCB, and Chinese bank cards). They can then make a payment directly in the WeChat app or via QR code.

Start accepting WeChat Pay →

## PAYMENT METHOD TYPE

Digital wallet

## RELEVANT CUSTOMER GEOGRAPHY

All geographies with Chinese consumers

## RELEVANT BUSINESS MODEL

E-commerce and marketplaces, on-demand services

## PRESENTMENT CURRENCY

AUD, CAD, EUR, GBP, HKD, JPY, SGD, USD

## RECURRING PAYMENTS

No

## REFUNDS

Yes

## DISPUTES

No

## PAYMENT CONFIRMATION

Immediate

[Embedded media omitted from source PDF]
