USE [Room_ReservationDB]
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (1, N'Room 1', 30, 1, 0)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (2, N'Room 2', 30, 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (3, N'Room 3', 15, 1, 0)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (4, N'Room 4', 15, 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (5, N'Room 5', 15, 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (6, N'Room 6 ', 10, 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (7, N'Room 7', 10, 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (8, N'Room 8', 10, 0, 1)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (9, N'Room 9', 10, 0, 0)
INSERT [dbo].[Rooms] ([Id], [Name], [Capacity], [HasTV], [HasProjector]) VALUES (10, N'Romm 10', 10, 0, 0)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
