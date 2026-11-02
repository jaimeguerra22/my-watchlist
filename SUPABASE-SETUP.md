# WARWATCH account setup

The app remains usable as a guest. Guest data stays in this browser's localStorage.
When Supabase is configured, users can register/sign in with email and password and
their library (titles, progress, activity, folders and history) is synced to their account.

## One-time setup

1. Create a Supabase project at https://supabase.com/dashboard.
2. In the project, open SQL Editor and run the contents of `supabase-setup.sql`.
3. In Project Settings > API, copy the Project URL and the **anon/public** key.
4. Paste those two values into `supabase-config.js`.
   Never use the `service_role` key in a browser app.
5. In Authentication > URL Configuration, add
   `https://jaimeguerra22.github.io/my-watchlist/` as a Site URL / allowed redirect URL.
6. In Authentication > Providers > Email, enable email/password. For production,
   keep email confirmation enabled and configure the email provider if required.

## Data safety

The app keeps local guest data. On first login it merges local and cloud data before
saving. The SQL enables row-level security so each authenticated user can only read
and write their own library. Keep exporting backups before major changes.

If the project is not configured, the app continues to work in guest mode and
shows a setup message when the account button is selected.
