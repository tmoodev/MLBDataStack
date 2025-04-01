-- baseball.PipelineLog definition

CREATE TABLE `PipelineLog` (
  `pipeline` text,
  `database` text,
  `table` text,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `username` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;