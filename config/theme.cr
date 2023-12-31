module Theme
  macro colors(color, weight)
    {%
      _colors = {
        "slate" => {
           50 => "#F8FAFC",
          100 => "#F1F5F9",
          200 => "#E2E8F0",
          300 => "#CBD5E1",
          400 => "#94A3B8",
          500 => "#64748B",
          600 => "#475569",
          700 => "#334155",
          800 => "#1E293B",
          900 => "#0F172A",
          950 => "#020617",
        },
        "gray" => {
           50 => "#F9FAFB",
          100 => "#F3F4F6",
          200 => "#E5E7EB",
          300 => "#D1D5DB",
          400 => "#9CA3AF",
          500 => "#6B7280",
          600 => "#4B5563",
          700 => "#374151",
          800 => "#1F2937",
          900 => "#111827",
          950 => "#030712",
        },
        "zinc" => {
           50 => "#FAFAFA",
          100 => "#F4F4F5",
          200 => "#E4E4E7",
          300 => "#D4D4D8",
          400 => "#A1A1AA",
          500 => "#71717A",
          600 => "#52525B",
          700 => "#3F3F46",
          800 => "#27272A",
          900 => "#18181B",
          950 => "#09090B",
        },
        "neutral" => {
           50 => "#FAFAFA",
          100 => "#F5F5F5",
          200 => "#E5E5E5",
          300 => "#D4D4D4",
          400 => "#A3A3A3",
          500 => "#737373",
          600 => "#525252",
          700 => "#404040",
          800 => "#262626",
          900 => "#171717",
          950 => "#0A0A0A",
        },
        "stone" => {
           50 => "#FAFAF9",
          100 => "#F5F5F4",
          200 => "#E7E5E4",
          300 => "#D6D3D1",
          400 => "#A8A29E",
          500 => "#78716C",
          600 => "#57534E",
          700 => "#44403C",
          800 => "#292524",
          900 => "#1C1917",
          950 => "#0C0A09",
        },
        "red" => {
           50 => "#FEF2F2",
          100 => "#FEE2E2",
          200 => "#FECACA",
          300 => "#FCA5A5",
          400 => "#F87171",
          500 => "#EF4444",
          600 => "#DC2626",
          700 => "#B91C1C",
          800 => "#991B1B",
          900 => "#7F1D1D",
          950 => "#450A0A",
        },
        "orange" => {
           50 => "#FFF7ED",
          100 => "#FFEDD5",
          200 => "#FED7AA",
          300 => "#FDBA74",
          400 => "#FB923C",
          500 => "#F97316",
          600 => "#EA580C",
          700 => "#C2410C",
          800 => "#9A3412",
          900 => "#7C2D12",
          950 => "#431407",
        },
        "amber" => {
           50 => "#FFF7ED",
          100 => "#FFEDD5",
          200 => "#FED7AA",
          300 => "#FDBA74",
          400 => "#FB923C",
          500 => "#F97316",
          600 => "#EA580C",
          700 => "#C2410C",
          800 => "#9A3412",
          900 => "#7C2D12",
          950 => "#431407",
        },
        "yellow" => {
           50 => "#FEFCE8",
          100 => "#FEF9C3",
          200 => "#FEF08A",
          300 => "#FDE047",
          400 => "#FACC15",
          500 => "#EAB308",
          600 => "#CA8A04",
          700 => "#A16207",
          800 => "#854D0E",
          900 => "#713F12",
          950 => "#422006",
        },
        "lime" => {
           50 => "#F7FEE7",
          100 => "#ECFCCB",
          200 => "#D9F99D",
          300 => "#BEF264",
          400 => "#A3E635",
          500 => "#84CC16",
          600 => "#65A30D",
          700 => "#4D7C0F",
          800 => "#3F6212",
          900 => "#365314",
          950 => "#1A2E05",
        },
        "green" => {
           50 => "#F0FDF4",
          100 => "#DCFCE7",
          200 => "#BBF7D0",
          300 => "#86EFAC",
          400 => "#4ADE80",
          500 => "#22C55E",
          600 => "#16A34A",
          700 => "#15803D",
          800 => "#166534",
          900 => "#14532D",
          950 => "#052E16",
        },
        "emerald" => {
           50 => "#ECFDF5",
          100 => "#D1FAE5",
          200 => "#A7F3D0",
          300 => "#6EE7B7",
          400 => "#34D399",
          500 => "#10B981",
          600 => "#059669",
          700 => "#047857",
          800 => "#065F46",
          900 => "#064E3B",
          950 => "#022C22",
        },
        "teal" => {
           50 => "#F0FDFA",
          100 => "#CCFBF1",
          200 => "#99F6E4",
          300 => "#5EEAD4",
          400 => "#2DD4BF",
          500 => "#14B8A6",
          600 => "#0D9488",
          700 => "#0F766E",
          800 => "#115E59",
          900 => "#134E4A",
          950 => "#042F2E",
        },
        "cyan" => {
           50 => "#ECFEFF",
          100 => "#CFFAFE",
          200 => "#A5F3FC",
          300 => "#67E8F9",
          400 => "#22D3EE",
          500 => "#06B6D4",
          600 => "#0891B2",
          700 => "#0E7490",
          800 => "#155E75",
          900 => "#164E63",
          950 => "#083344",
        },
        "sky" => {
           50 => "#F0F9FF",
          100 => "#E0F2FE",
          200 => "#BAE6FD",
          300 => "#7DD3FC",
          400 => "#38BDF8",
          500 => "#0EA5E9",
          600 => "#0284C7",
          700 => "#0369A1",
          800 => "#075985",
          900 => "#0C4A6E",
          950 => "#082F49",
        },
        "blue" => {
           50 => "#EFF6FF",
          100 => "#DBEAFE",
          200 => "#BFDBFE",
          300 => "#93C5FD",
          400 => "#60A5FA",
          500 => "#3B82F6",
          600 => "#2563EB",
          700 => "#1D4ED8",
          800 => "#1E40AF",
          900 => "#1E3A8A",
          950 => "#172554",
        },
        "indigo" => {
           50 => "#EEF2FF",
          100 => "#E0E7FF",
          200 => "#C7D2FE",
          300 => "#A5B4FC",
          400 => "#818CF8",
          500 => "#6366F1",
          600 => "#4F46E5",
          700 => "#4338CA",
          800 => "#3730A3",
          900 => "#312E81",
          950 => "#1E1B4B",
        },
        "violet" => {
           50 => "#F5F3FF",
          100 => "#EDE9FE",
          200 => "#DDD6FE",
          300 => "#C4B5FD",
          400 => "#A78BFA",
          500 => "#8B5CF6",
          600 => "#7C3AED",
          700 => "#6D28D9",
          800 => "#5B21B6",
          900 => "#4C1D95",
          950 => "#2E1065",
        },
        "purple" => {
           50 => "#FAF5FF",
          100 => "#F3E8FF",
          200 => "#E9D5FF",
          300 => "#D8B4FE",
          400 => "#C084FC",
          500 => "#A855F7",
          600 => "#9333EA",
          700 => "#7E22CE",
          800 => "#6B21A8",
          900 => "#581C87",
          950 => "#3B0764",
        },
        "fuchsia" => {
           50 => "#FDF4FF",
          100 => "#FAE8FF",
          200 => "#F5D0FE",
          300 => "#F0ABFC",
          400 => "#E879F9",
          500 => "#D946EF",
          600 => "#C026D3",
          700 => "#A21CAF",
          800 => "#86198F",
          900 => "#701A75",
          950 => "#4A044E",
        },
        "pink" => {
           50 => "#FDF2F8",
          100 => "#FCE7F3",
          200 => "#FBCFE8",
          300 => "#F9A8D4",
          400 => "#F472B6",
          500 => "#EC4899",
          600 => "#DB2777",
          700 => "#BE185D",
          800 => "#9D174D",
          900 => "#831843",
          950 => "#500724",
        },
        "rose" => {
           50 => "#FFF1F2",
          100 => "#FFE4E6",
          200 => "#FECDD3",
          300 => "#FDA4AF",
          400 => "#FB7185",
          500 => "#F43F5E",
          600 => "#E11D48",
          700 => "#BE123C",
          800 => "#9F1239",
          900 => "#881337",
          950 => "#4C0519",
        },
      }
    %}
    {{ _colors[color][weight] || raise "Color #{color} or #{weight} not found" }}
  end

  macro spacing(value)
    {%
      _spacing = {
           0 => "0",
        "px" => "1",
         0.5 => "2",
           1 => "4",
         1.5 => "6",
           2 => "8",
         2.5 => "10",
           3 => "12",
         3.5 => "14",
           4 => "16",
           5 => "20",
           6 => "24",
           7 => "28",
           8 => "32",
           9 => "36",
          10 => "40",
          11 => "44",
          12 => "48",
          14 => "56",
          16 => "64",
          20 => "80",
          24 => "96",
          28 => "112",
          32 => "128",
          36 => "144",
          40 => "160",
          44 => "176",
          48 => "192",
          52 => "208",
          56 => "224",
          60 => "240",
          64 => "256",
          72 => "288",
          80 => "320",
          96 => "384",
      }
    %}
    {{ _spacing[value] || raise "Spacing #{value} not found" }}
  end

  macro font_size(value)
    {%
      _font_sizes = {
        "xs"   => "12",
        "sm"   => "14",
        "base" => "16",
        "lg"   => "18",
        "xl"   => "20",
        "2xl"  => "24",
        "3xl"  => "30",
        "4xl"  => "36",
        "5xl"  => "48",
        "6xl"  => "60",
        "7xl"  => "72",
        "8xl"  => "96",
        "9xl"  => "128",
      }
    %}
    {{ _font_sizes[value] || raise "Font Size #{value} not found" }}
  end

  macro line_height(value)
    {%
      _line_heights = {
        "xs"   => "16",
        "sm"   => "20",
        "base" => "24",
        "lg"   => "28",
        "xl"   => "28",
        "2xl"  => "32",
        "3xl"  => "36",
        "4xl"  => "40",
        "5xl"  => "48",
        "6xl"  => "60",
        "7xl"  => "72",
        "8xl"  => "96",
        "9xl"  => "128",
      }
    %}
    {{ _line_heights[value] || raise "Line Height #{value} not found" }}
  end

  macro font_weight(value)
    {%
      _font_weights = {
        "thin"       => "100",
        "extralight" => "200",
        "light"      => "300",
        "normal"     => "400",
        "medium"     => "500",
        "semibold"   => "600",
        "bold"       => "700",
        "extrabold"  => "800",
        "black"      => "900",
      }
    %}
    {{ _font_weights[value] || raise "Font Weight #{value} not found" }}
  end
end
