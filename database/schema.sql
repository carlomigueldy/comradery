DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.notifications;
DROP TABLE IF EXISTS public.interests;
DROP TABLE IF EXISTS public.user_interests;
DROP TABLE IF EXISTS public.teams;
DROP TABLE IF EXISTS public.team_members;
DROP TABLE IF EXISTS public.team_requests;
DROP TABLE IF EXISTS public.matchings;
DROP TABLE IF EXISTS public.conversations;
DROP TABLE IF EXISTS public.conversation_messages;
DROP TABLE IF EXISTS public.conversation_participants;

DELETE FROM auth.users;

CREATE TABLE public.users (
    id UUID PRIMARY KEY NOT NULL REFERENCES auth.users (id),
    first_name VARCHAR CHECK (first_name <> ''),
    last_name VARCHAR CHECK (last_name <> ''),
    email VARCHAR NOT NULL CHECK (email <> ''),
    bio VARCHAR CHECK (bio <> ''),
    photo_url VARCHAR CHECK (first_name <> ''),
    external_links_json JSON,
    created_at TIMESTAMP DEFAULT now() NOT NULL,
    updated_at TIMESTAMP DEFAULT now() NOT NULL,
    deleted_at TIMESTAMP
);

CREATE TABLE public.notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL REFERENCES public.users (id),
    notifiable_id uuid NOT NULL,
    notifiable_type VARCHAR NOT NULL,
    type VARCHAR NOT NULL,
    read_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT now() NOT NULL,
    updated_at TIMESTAMP DEFAULT now() NOT NULL,
    deleted_at TIMESTAMP
);
COMMENT ON COLUMN public.notifications.notifiable_id IS 'A generic FK ID, table will be based on notifiable_type';
COMMENT ON COLUMN public.notifications.notifiable_type IS 'The value should be the table names';
COMMENT ON COLUMN public.notifications.type IS 'The type of notification. ("team_join_request_accepted", "team_join_request_rejected", "team_invite_accepted", "team_invite_rejected", "new_match")';
COMMENT ON COLUMN public.notifications.read_at IS 'The timestamp when the notification was marked as read by the user';

CREATE TABLE public.interests (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
    name VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT now() NOT NULL,
    updated_at TIMESTAMP DEFAULT now() NOT NULL,
    deleted_at TIMESTAMP
);

CREATE TABLE public.user_interests (
    interest_id UUID NOT NULL REFERENCES public.interests (id),
    user_id UUID NOT NULL REFERENCES public.users (id),
    created_at TIMESTAMP DEFAULT now() NOT NULL,
    updated_at TIMESTAMP DEFAULT now() NOT NULL,
    deleted_at TIMESTAMP,
    PRIMARY KEY (interest_id, user_id)
);

CREATE TABLE public.teams (
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    name VARCHAR NOT NULL,
    description TEXT,
    photo_url VARCHAR,
    welcome_to_team_json JSON,
    external_links_json JSON,
    created_by UUID NOT NULL REFERENCES public.users (id),
    created_at TIMESTAMP DEFAULT now() NOT NULL,
    updated_at TIMESTAMP DEFAULT now() NOT NULL,
    deleted_at TIMESTAMP
);

CREATE TABLE public.team_members (
    user_id uuid NOT NULL REFERENCES public.users (id),
    team_id uuid NOT NULL REFERENCES public.teams (id),
    created_at TIMESTAMP DEFAULT now() NOT NULL,
    updated_at TIMESTAMP DEFAULT now() NOT NULL,
    deleted_at TIMESTAMP,
    PRIMARY KEY (user_id, team_id)
);
COMMENT ON COLUMN public.team_members.created_at IS 'Indicates the join date of a user';

CREATE TABLE public.team_requests (
    user_id uuid NOT NULL REFERENCES public.users (id),
    team_id uuid NOT NULL REFERENCES public.teams (id),
    type VARCHAR NOT NULL,
    created_by uuid NOT NULL REFERENCES public.users (id),
    created_at TIMESTAMP DEFAULT now() NOT NULL,
    updated_at TIMESTAMP DEFAULT now() NOT NULL,
    deleted_at TIMESTAMP,
    PRIMARY KEY (user_id, team_id)
);
COMMENT ON COLUMN public.team_requests.type IS 'Accepts only "invite" or "join_request" ';
COMMENT ON COLUMN public.team_requests.created_by IS 'The user who initiated the request. If it''s a "join_request" then it''ll have the same uuid value with "user_id" field';

CREATE TABLE public.matchings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
    liked BOOLEAN DEFAULT false NOT NULL,
    read_at TIMESTAMP,
    target_user_id UUID NOT NULL REFERENCES public.users (id),
    created_by UUID NOT NULL REFERENCES public.users (id),
    created_at TIMESTAMP DEFAULT now() NOT NULL,
    updated_at TIMESTAMP DEFAULT now() NOT NULL,
    deleted_at TIMESTAMP
);

CREATE TABLE public.conversations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
    name VARCHAR,
    created_by uuid NOT NULL REFERENCES public.users (id),
    created_at TIMESTAMP DEFAULT now() NOT NULL,
    updated_at TIMESTAMP DEFAULT now() NOT NULL,
    deleted_at TIMESTAMP,
    type VARCHAR DEFAULT 'private'::VARCHAR NOT NULL
);
COMMENT ON COLUMN public.conversations.name IS 'Trigger will handle the default name of the conversation, then parsed in UI if it''s mono-convo and not multi-participant convo.';

CREATE TABLE public.conversation_messages (
    id UUID DEFAULT gen_random_uuid() NOT NULL,
    conversation_id UUID NOT NULL REFERENCES public.conversations (id),
    content text NOT NULL,
    type VARCHAR DEFAULT 'text'::VARCHAR NOT NULL,
    created_at TIMESTAMP DEFAULT now() NOT NULL,
    updated_at TIMESTAMP DEFAULT now() NOT NULL,
    deleted_at TIMESTAMP,
    created_by UUID NOT NULL REFERENCES public.users (id)
);
COMMENT ON COLUMN public.conversation_messages.type IS 'Types: "text", "giphy", "photo", "video"';

CREATE TABLE public.conversation_participants (
    user_id UUID NOT NULL REFERENCES public.users (id),
    conversation_id UUID NOT NULL public.conversations(id),
    created_at TIMESTAMP DEFAULT now() NOT NULL,
    updated_at TIMESTAMP DEFAULT now() NOT NULL,
    deleted_at TIMESTAMP,
    PRIMARY KEY (user_id, conversation_id)
);