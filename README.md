Medical Passport
================

Educational (and maybe social in the future) application for pediatric patients
to track their progress

Features
--------

Creating a user account is protected

Models
------

1. Users -> Provider & Participant (STI)
2. Allergens
3. Allergies (assignment of allergen to participant)
4. Drugs
5. Indications (belongs_to :drug)
6. Dosages (belongs_to :drug)
7. Prescriptions (assignment of drug, indication, and dosage to participant)
8. Sites
9. Divisions (belongs_to :site)
10. Roles

Future
------

Things that still need to be implemented or changed.

### Still need to do ###
1. Add `conditions`, `procedures`, and `diagnoses`.
2. Add `cancan` support
3. Change to JQuery
4. Client-side validations (gem 'client_side_validations' at https://github.com/bcardarella/client_side_validations/)
5. Refactor roles to User `has_one` Role, versus a `has_and_belongs_to_many` relationship.  I do not see a need for this complexity, considering that roles will inherit from each other.
6. Remove ability to edit roles.  Should be fine to leave them hard-coded.
7. Add `gem paperclip` to `sites` to allow uploading of images.

Questions?
----------

If you have any questions, please feel free to ask on 
[twitter](https://twitter.com/maxckramer).