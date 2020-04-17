# README

EssentialWorkerAid is the prototype of an app for the COVID19 era, for people stuck at home to send aid to those who have been deemed "Essential Workers".

Essential workers face new challenges in making ends meet, finding childcare or home health care, finding isolated housing away from vulnerable families, having time and energy to feed themselves and just to feel appreciated.

This app currently implements two features regarding those needs: financial requests and written appreciation.

# Flow

The login is reached at the root directory, ie localhost:3030/

Users can register and sign into the app as an essential worker or as a supporter, there is no overlap in these roles.

Essential Workers can
-see "kudos" from the supporters, and delete inappropriate kudos
-create and update financial requests, and confirm receipt of funds
-should not be able to see any supporter pages

Supporters can
-see financial requests and respond to them with as large or small a payment as they like. 
-write kudos for workers, and target them at specific professional categories
-should not be able to see any worker pages

All users must
-create a login and be authenticated with a secure password to access the site.

When a supporter responds to a worker's financial request, the request is decreased by the supporter's gift.  When the worker's request = $0, it is updated with a status of "fulfilled" and does not appear to supporters anymore.  When the worker confirms receipt of a supporter's gift, the supporter's response is updated with a status of "received."

~End of Version 1 features~