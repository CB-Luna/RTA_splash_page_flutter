import 'package:supabase_flutter/supabase_flutter.dart';

//////// DEV ////////
const String supabaseUrl = 'https://xvqbmmjdzkkxtlsszorh.supabase.co';
const String anonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh2cWJtbWpkemtreHRsc3N6b3JoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTAyMjY5NDksImV4cCI6MjAwNTgwMjk0OX0.lk_f5gPuCyvlhzWDl8WKmyIo7RpeqZubx9L-JyVDNkE';

final supabase = Supabase.instance.client;
